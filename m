Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606C6C46467
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13796.1646329345641679797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LrIf0K61;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 0101017f50e032c1-709efe03-b494-48de-8670-492ef7e1a778-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=13ONABh61dLpFffzuy8umeSSW/qgaDWKlsspSiSOzmk=;
	b=LrIf0K61CPgAZ73NWDl6HIrZINe4zVT/w8Srjpt/d56xuzaHApq9S/J7rL22JoFr
	Z/5oPJzOribg9mMIARWqmXL9hr30Fr6B1JBitNqgSoh173z+9BOxAM+WZmJMFCyhBbt
	vaEdFjl1YpVCoJth7gPP8sQgRFfK9zoANLlNd9AQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=13ONABh61dLpFffzuy8umeSSW/qgaDWKlsspSiSOzmk=;
	b=NQ0RLpv94XmgfXOVyD4OwBxtDOm/EwjuSi98gEajnLacAadBFFNsZrFT8ootBqz8
	Ps5iAy7qMA5JKXvRZ+pF6tXnneF64l6Pl3+Zgs332Ykz80FCMMHjR5OXYxmmZjzCEYf
	F4QgCSMK1HY4rGr6kFWpaHuQEebSKvhFLDkHZupg=
Content-Type: multipart/mixed; boundary="===============0271274010287143895=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.34.6 SUCCEEDED
Message-ID: 
 <0101017f50e032c1-709efe03-b494-48de-8670-492ef7e1a778-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162696

--===============0271274010287143895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.34.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.34.5-2.34.6.patch
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
--===============0271274010287143895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (0 cached, 843 parsed). 1522 targets, 50 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-32 sysroot...done.
Removing 118 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-f5a35fff12da485d13fdb1810201f832111a4ceb"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f5a35fff12da485d13fdb1810201f832111a4ceb"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 453 Local 306 Mirrors 0 Missed 147 Current 222 (67% match, 78% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.54.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 798 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 839 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_fetch)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 840 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 852 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 853 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 854 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_fetch)
NOTE: Running task 855 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 874 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 901 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_write_config)
NOTE: Running task 904 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 923 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 926 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_write_config)
NOTE: Running task 927 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 928 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 929 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 930 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 933 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 934 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 935 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 937 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 938 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_fetch)
NOTE: Running task 941 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 942 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 943 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 945 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 946 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 947 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 948 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 949 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 950 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 951 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 955 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 956 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 957 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 958 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_fetch)
NOTE: Running task 959 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 960 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 961 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.54.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Started
NOTE: Running task 966 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 967 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 968 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 969 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 970 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 971 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Running task 972 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 973 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 974 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 975 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 976 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running setscene task 393 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: Running task 977 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: Running task 981 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 982 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 983 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 985 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 986 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 987 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 988 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 989 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 990 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 997 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_fetch)
NOTE: Running task 999 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_unpack)
NOTE: Running task 1001 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_write_config)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 1004 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: Running setscene task 396 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Started
NOTE: Running setscene task 400 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running setscene task 406 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: Running task 1009 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1010 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1011 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1012 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.54.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running setscene task 408 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: Running setscene task 410 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_populate_sysroot_setscene)
NOTE: Running task 1014 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 1016 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: Running setscene task 413 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1028 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 1029 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running setscene task 415 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.70.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1035 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 1036 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_unpack)
NOTE: Running task 1037 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 1038 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 1039 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 1040 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 1041 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Started
NOTE: Running task 1042 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 1050 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1070 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1071 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1072 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 1073 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 1074 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Started
NOTE: Running task 1075 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 1076 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_unpack)
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1077 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 1078 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Started
NOTE: Running task 1079 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1080 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1082 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 1083 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: Running task 1085 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 1117 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1118 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_patch)
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: Running task 1119 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 1120 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 1122 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: Running task 1123 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 1124 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1125 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 1126 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 1127 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running setscene task 420 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running task 1128 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 423 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1138 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 1142 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1144 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 1145 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: Running task 1151 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1152 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1154 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 1155 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1156 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: Running setscene task 429 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running task 1157 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1158 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe mesa-2_21.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: Running task 1165 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1166 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 1167 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 1174 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: Running task 1175 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1176 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1177 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 1178 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 1179 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1180 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1181 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1182 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 445 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running task 1183 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: Running task 1184 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1187 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1188 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1189 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 447 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 449 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1195 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running task 1196 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 1197 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1198 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1199 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1200 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1201 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 456 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.70.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 469 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.22.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 472 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1233 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 482 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1250 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1251 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 502 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.22-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 509 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1264 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1269 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1278 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 521 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe expat-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: Running task 1298 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1299 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 526 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 528 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 544 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1312 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 546 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 551 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 558 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 561 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running setscene task 563 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1326 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 581 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1335 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1381 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: Running task 1382 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 1396 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Succeeded
NOTE: Running task 1417 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1418 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_generate_toolchain_file)
NOTE: Running task 1419 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic unihash changed to 7f034ccbf2e3a472258067090553acdf5027623371e9d57ad8b393541b371f26
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1428 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 638 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 652 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+f8bdc30482-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1455 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3d7bfc5d385ac1d12e45c0dbcbe666c4e1facd87543f06c097bc122ce3e58615
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1763 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1913 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1935 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1936 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1983 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1987 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1988 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1989 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1990 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2007 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2008 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2009 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2010 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2011 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2013 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2021 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2022 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2023 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2038 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2039 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Running task 2063 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2066 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2067 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: Running task 2070 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2076 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2079 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2081 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: Running task 2083 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 2087 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2088 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: Running task 2091 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2092 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: Running task 2093 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: Running task 2094 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: Running task 2095 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2096 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2097 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: Running task 2098 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2099 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_configure)
NOTE: Running task 2101 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2103 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: Running task 2104 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: Running task 2105 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2107 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2108 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2109 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2110 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: Running task 2113 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2114 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2115 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2116 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: Running task 2117 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2118 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2119 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2120 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2121 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2122 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2123 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2124 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2125 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2126 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2127 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2128 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2129 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2130 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2132 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2133 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: Running task 2134 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2135 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2136 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2137 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2138 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 2139 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: Running task 2140 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2141 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: Running task 2142 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2143 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 2144 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: Running task 2145 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2146 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 2147 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: Running task 2148 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: Running task 2149 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: Running task 2151 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2152 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2153 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: Running task 2154 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2157 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2159 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: Running task 2160 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 2161 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2162 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: Running task 2163 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2164 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2165 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2166 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2167 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2168 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2169 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2170 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2171 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2172 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2173 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2174 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2175 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2176 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2177 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2178 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: Running task 2179 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2180 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: Running task 2181 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2182 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2183 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2184 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2185 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2186 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2187 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: Running task 2188 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2189 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: Running task 2190 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2192 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: Running task 2194 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2195 of 2315 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Failed
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2195 tasks of which 1887 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata
Summary: There were 61 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libsecret/0.20.4-r0/temp/log.do_packagedata.3147242
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata) failed with exit code '1'

--===============0271274010287143895==
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
DISTRO_VERSION       = "3.4+snapshot-f5a35fff12da485d13fdb1810201f832111a4ceb"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f5a35fff12da485d13fdb1810201f832111a4ceb"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 146 Local 3 Mirrors 0 Missed 143 Current 544 (2% match, 79% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 671 of 690 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1252 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1564 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1656 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_fetch)
NOTE: Running task 1659 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1673 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1674 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1677 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_fetch)
NOTE: Running task 1678 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1709 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1765 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_write_config)
NOTE: Running task 1766 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1785 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1790 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_write_config)
NOTE: Running task 1791 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1795 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1798 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1803 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1804 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1807 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1810 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1818 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1832 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_fetch)
NOTE: Running task 1839 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1840 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1841 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1843 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1844 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1845 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1848 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1849 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1850 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1861 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1862 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1863 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_fetch)
NOTE: Running task 1864 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 1865 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 1866 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 1868 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1869 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 1870 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1871 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1872 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1879 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_fetch)
NOTE: Running task 1880 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_write_config)
NOTE: Running task 1895 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1914 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1915 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1918 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1919 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 1920 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1964 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 1965 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1966 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1967 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1968 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Started
NOTE: Running task 1969 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1970 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_fetch: Succeeded
NOTE: Running task 1971 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 1972 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_unpack)
NOTE: Running task 1973 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 1974 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: Running task 1975 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1976 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 1977 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1978 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Succeeded
NOTE: Running task 1979 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 1980 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 1981 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: Running task 1982 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1983 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_unpack)
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 1985 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 1986 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1987 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: Running task 1988 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 1989 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 1990 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 1991 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 1992 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: Running task 1993 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: Running task 1994 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: Running task 1995 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 1996 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1997 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_unpack)
NOTE: Running task 1998 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 1999 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2000 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2001 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2002 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2003 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2004 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 2005 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_unpack)
NOTE: Running task 2006 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2007 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 2008 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: Running task 2009 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: Running task 2010 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2011 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2012 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: Running task 2013 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2014 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 2015 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Started
NOTE: Running task 2016 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: Running task 2017 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 2018 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2019 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2020 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2021 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2022 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2023 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: Running task 2024 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: Running task 2025 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2026 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2027 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2028 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 2029 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_patch)
NOTE: Running task 2030 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2031 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2032 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2033 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2034 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: Running task 2035 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: Running task 2036 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2037 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2038 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2039 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 2040 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2041 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2042 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2043 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2044 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe pango-1.50.4-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: Running task 2045 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: Running task 2046 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2047 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2048 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2049 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2051 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2052 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: Running task 2053 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2054 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2055 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: Running task 2056 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: Running task 2057 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2058 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2059 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2061 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_patch: Started
NOTE: Running task 2062 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2063 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2064 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2065 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2066 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2067 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.4-r0: task do_patch: Succeeded
NOTE: Running task 2068 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2069 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: Running task 2070 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2071 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2072 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 2073 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2074 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2075 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2076 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2077 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2078 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2079 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2080 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2081 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: Running task 2082 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2083 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2084 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2085 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: Running task 2086 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2087 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: Running task 2088 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: Running task 2089 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 2090 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2091 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2120 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: Running task 2121 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Started
NOTE: Running task 2122 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2123 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2124 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2125 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2126 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2129 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 2133 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: Running task 2135 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2136 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c37505a5f87be3cd51299bf70926728ba433007beef446ed9c9eb0a9ccf7f9c
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2149 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2151 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_patch)
NOTE: Running task 2152 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2153 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_configure)
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Started
NOTE: Running task 2154 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: Running task 2155 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2156 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2158 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2159 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: Running task 2160 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Succeeded
NOTE: Running task 2161 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2162 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_generate_toolchain_file)
NOTE: Running task 2163 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic)
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2164 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2165 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic unihash changed to 7f034ccbf2e3a472258067090553acdf5027623371e9d57ad8b393541b371f26
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2166 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2167 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2168 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2169 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2170 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2171 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2172 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: Running task 2173 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2174 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2175 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2176 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2177 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2178 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2179 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2180 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: Running task 2181 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: Running task 2182 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2184 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2185 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 2187 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2188 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2189 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 2191 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: Running task 2192 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2193 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2194 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2195 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 2196 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: Running task 2198 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2199 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: Running task 2202 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2203 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2204 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: Running task 2205 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2208 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 2209 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2211 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 2212 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2213 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: Running task 2214 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2215 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2216 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2217 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2218 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2219 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2220 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: Running task 2223 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2224 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2225 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2226 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2227 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: Running task 2228 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: Running task 2229 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2231 of 2368 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Failed
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2231 tasks of which 1958 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata
Summary: There were 61 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libsecret/0.20.4-r0/temp/log.do_packagedata.2926074
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata) failed with exit code '1'

--===============0271274010287143895==
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
DISTRO_VERSION       = "3.4+snapshot-f5a35fff12da485d13fdb1810201f832111a4ceb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f5a35fff12da485d13fdb1810201f832111a4ceb"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 150 Local 3 Mirrors 0 Missed 147 Current 550 (2% match, 79% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 681 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1263 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1576 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1668 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_fetch)
NOTE: Running task 1671 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1685 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1686 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1689 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_fetch)
NOTE: Running task 1690 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1721 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1779 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_write_config)
NOTE: Running task 1780 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1799 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1804 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_write_config)
NOTE: Running task 1805 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1809 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1812 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1817 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1818 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1821 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1824 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1832 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1847 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 1855 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1856 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1857 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1859 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1860 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1861 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1862 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1863 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1864 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1865 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1877 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: Running task 1878 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1879 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 1881 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1882 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_fetch)
NOTE: Running task 1883 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1884 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1886 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 1887 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1888 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1895 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_fetch)
NOTE: Running task 1900 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_write_config)
NOTE: Running task 1914 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1917 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1940 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 1943 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1944 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1945 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1946 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_unpack)
NOTE: Running task 1992 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1993 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1994 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1995 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 1996 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: Running task 1997 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1998 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_unpack)
NOTE: Running task 1999 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 2000 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: Running task 2001 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2002 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2003 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2004 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Started
NOTE: Running task 2005 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2006 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2007 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2008 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: Running task 2009 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: Running task 2010 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: Running task 2011 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: Running task 2012 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2013 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 2014 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: Running task 2015 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 2016 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2017 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2018 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2019 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: Running task 2020 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2021 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: Running task 2022 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Started
NOTE: Running task 2023 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2024 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 2025 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2026 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_unpack)
NOTE: Running task 2027 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2028 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2029 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2030 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2031 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 2032 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_unpack)
NOTE: Running task 2033 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe pango-1.50.4-r0: task do_unpack: Started
NOTE: Running task 2034 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: Running task 2035 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2036 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2037 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2038 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: Running task 2039 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2040 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 2041 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2042 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2043 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2044 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: Running task 2045 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2046 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Started
NOTE: Running task 2047 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: Running task 2048 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 2049 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2050 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2051 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2052 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2054 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 2055 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2056 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2057 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2059 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2060 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_patch)
NOTE: Running task 2061 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2062 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: Running task 2063 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: Running task 2064 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2065 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 2066 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2067 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 2068 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: Running task 2069 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: Running task 2070 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: Running task 2071 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Started
NOTE: Running task 2072 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2073 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_patch)
NOTE: Running task 2074 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2075 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2076 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: Running task 2077 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2078 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2079 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2080 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2081 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: Running task 2082 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2083 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2084 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2085 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: Running task 2086 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2087 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: Running task 2088 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2089 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2090 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2091 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.4-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2092 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: Running task 2093 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2094 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2095 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2096 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2097 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: Running task 2099 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2100 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2101 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2102 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2103 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2104 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2107 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2108 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2109 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: Running task 2110 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2111 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2112 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2113 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2114 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2115 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2116 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2117 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2118 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2119 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2120 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: Running task 2121 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: Running task 2122 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2123 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2152 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2153 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2154 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2155 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2156 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2157 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2160 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: Running task 2164 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2165 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: Running task 2166 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2167 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7bcf69c26b41fb05121df304f97927e5d6a8057df365c3d4c386a4af93023e72
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2180 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_patch)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Started
NOTE: Running task 2182 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2183 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2184 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: Running task 2185 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2189 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: Running task 2190 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: Running task 2191 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: Running task 2192 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: Running task 2193 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_generate_toolchain_file)
NOTE: Running task 2194 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2195 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic unihash changed to 7f034ccbf2e3a472258067090553acdf5027623371e9d57ad8b393541b371f26
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2197 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2198 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: Running task 2199 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2200 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: Running task 2204 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2205 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2206 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: Running task 2207 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2208 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2209 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2210 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2211 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2212 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2213 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2214 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2216 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: Running task 2218 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2220 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2222 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2223 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: Running task 2224 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: Running task 2228 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2230 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2231 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2232 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2233 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2234 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2235 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: Running task 2237 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2238 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2240 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: Running task 2241 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 2242 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2245 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: Running task 2246 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2247 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2248 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2249 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2250 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2251 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2252 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2253 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: Running task 2254 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: Running task 2256 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2257 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2259 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2260 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2261 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2262 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2263 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 2265 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2266 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2267 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2268 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: Running task 2269 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: Running task 2270 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2272 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: Running task 2273 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2274 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2275 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: Running task 2277 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2278 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: Running task 2279 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Failed
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2279 tasks of which 1982 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata
Summary: There were 61 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libsecret/0.20.4-r0/temp/log.do_packagedata.2826825
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata) failed with exit code '1'

--===============0271274010287143895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.34.5.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://reduce-memory-overheads.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.34.6.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch file://reduce-memory-overheads.patch file://0001-Fix-build-without-opengl-or-es.patch file://reproducibility.patch"
packages/core2-32-poky-linux/webkitgtk: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk: PV changed from "2.34.5" to "2.34.6"
Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.19.10 to libjavascriptcoregtk-4.0.so.18.19.11
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.55.8 to libwebkit2gtk-4.0.so.37.55.9
  /usr/lib/libjavascriptcoregtk-4.0.so.18.19.10 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.19.11
  /usr/lib/libwebkit2gtk-4.0.so.37.55.8 moved to /usr/lib/libwebkit2gtk-4.0.so.37.55.9
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libwebkit2gtk-4.0.so.37.55.8 /usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.19.10", added "/usr/lib/.debug/libjavascriptcoregtk-4.0.so.18.19.11 /usr/lib/.debug/libwebkit2gtk-4.0.so.37.55.9"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 2825034548 to 2825052832 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 144048549 to 144049983 (+0%)
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.34.5" to "2.34.6"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-4.0.so.18.19.10 /usr/lib/libwebkit2gtk-4.0.so.37.55.8", added "/usr/lib/libwebkit2gtk-4.0.so.37.55.9 /usr/lib/libjavascriptcoregtk-4.0.so.18.19.11"
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.34.5 [default] to 2.34.6 [default]
packages/core2-32-poky-linux/webkitgtk/webkitgtk: PV changed from "2.34.5" to "2.34.6"

--===============0271274010287143895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-4.0.so.18 changed symlink target from libjavascriptcoregtk-4.0.so.18.19.10 to libjavascriptcoregtk-4.0.so.18.19.11
  /usr/lib/libwebkit2gtk-4.0.so.37 changed symlink target from libwebkit2gtk-4.0.so.37.55.8 to libwebkit2gtk-4.0.so.37.55.9
  /usr/lib/libjavascriptcoregtk-4.0.so.18.19.10 moved to /usr/lib/libjavascriptcoregtk-4.0.so.18.19.11
  /usr/lib/libwebkit2gtk-4.0.so.37.55.8 moved to /usr/lib/libwebkit2gtk-4.0.so.37.55.9
packages/core2-32-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkit2gtk-4.0.so.37.55.8 /usr/lib/libjavascriptcoregtk-4.0.so.18.19.10", added "/usr/lib/libwebkit2gtk-4.0.so.37.55.9 /usr/lib/libjavascriptcoregtk-4.0.so.18.19.11"

--===============0271274010287143895==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.34.5-2.34.6.patch"

From 99b3bc27d92a3fea48f3878b7c66628cdd4cc46b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 17:33:01 +0000
Subject: [PATCH] webkitgtk: upgrade 2.34.5 -> 2.34.6

---
 .../webkit/{webkitgtk_2.34.5.bb => webkitgtk_2.34.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.5.bb => webkitgtk_2.34.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
index 9f5846858f..52cc185eb3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "68930643af7a47a3af05f46d66e784422433753dab335d3282f319a85a5629b4"
+SRC_URI[sha256sum] = "6bc8fd034aad0432a2459ce4fc7ee25ad65a4924c618bf8d93b52b0c1a84c1f6"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.27.0


--===============0271274010287143895==
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
DISTRO_VERSION       = "3.4+snapshot-f5a35fff12da485d13fdb1810201f832111a4ceb"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f5a35fff12da485d13fdb1810201f832111a4ceb"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 150 Local 3 Mirrors 0 Missed 147 Current 550 (2% match, 79% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 681 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1263 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1576 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1668 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_fetch)
NOTE: Running task 1671 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1685 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1686 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1689 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_fetch)
NOTE: Running task 1690 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1721 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1779 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_write_config)
NOTE: Running task 1780 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1799 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1804 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_write_config)
NOTE: Running task 1805 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1809 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1812 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1817 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1818 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1821 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1824 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1832 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1847 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_fetch)
NOTE: Running task 1855 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1856 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1857 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1858 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1860 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1861 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1862 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1863 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1864 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1865 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: Running task 1877 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1878 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1879 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 1880 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1881 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1882 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 1883 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 1884 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_fetch)
NOTE: Running task 1886 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1887 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 1888 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1895 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_fetch)
NOTE: Running task 1900 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_write_config)
NOTE: Running task 1914 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1917 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1940 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1941 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 1942 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1945 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: Running task 1946 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1991 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: Running task 1992 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 1993 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 1994 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 1995 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_unpack)
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1996 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: Running task 1997 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: Running task 1998 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 1999 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: Running task 2000 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: Running task 2001 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2002 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2003 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2004 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: Running task 2005 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: Running task 2006 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2007 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2008 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 2009 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: Running task 2010 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 2011 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: Running task 2012 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: Running task 2013 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2014 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2015 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_unpack)
NOTE: Running task 2016 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2017 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2018 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Started
NOTE: Running task 2019 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2020 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Started
NOTE: Running task 2021 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Started
NOTE: Running task 2022 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: Running task 2023 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: Running task 2024 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: Running task 2025 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2026 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_unpack)
NOTE: Running task 2027 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: Running task 2028 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 2029 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2030 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: Running task 2031 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 2032 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: Running task 2033 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Started
NOTE: Running task 2034 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_unpack)
NOTE: Running task 2035 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2036 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_unpack: Started
NOTE: Running task 2037 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: Running task 2038 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: Running task 2039 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: Running task 2040 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2041 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2042 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2043 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2044 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2045 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2046 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2047 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2048 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2049 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: Running task 2050 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 2051 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2052 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: Running task 2053 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2054 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2055 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: Running task 2056 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2057 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: Running task 2058 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_patch)
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2059 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 2060 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: Running task 2061 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2062 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2063 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: Running task 2064 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 2065 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: Running task 2066 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: Running task 2067 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: recipe pango-1.50.4-r0: task do_unpack: Succeeded
NOTE: Running task 2068 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2069 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: Running task 2070 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2071 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Started
NOTE: Running task 2072 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2073 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: Running task 2074 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2075 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2076 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: Running task 2077 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 2078 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2079 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2080 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: Running task 2081 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2082 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2083 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2084 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2085 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: Running task 2086 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2087 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2088 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2089 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2090 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2091 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: Running task 2093 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2094 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2095 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2096 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2098 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2099 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2100 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2101 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2102 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2103 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2104 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2105 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2108 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2109 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2110 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2111 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2112 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2113 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2114 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: Running task 2115 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2118 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2119 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2120 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2121 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Started
NOTE: Running task 2123 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2124 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2125 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: Running task 2154 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2155 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2156 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2157 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: Running task 2158 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2164 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2165 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: Running task 2166 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2167 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fbc8394c590b06edd0efb0d4abbb9e0d085e377cf516c1a2a3c0f90c7dbff7a9
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2180 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: Running task 2181 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: Running task 2183 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: Running task 2184 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: Running task 2185 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2186 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2187 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: Running task 2188 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2189 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: Running task 2192 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2193 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2194 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_generate_toolchain_file)
NOTE: Running task 2196 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2197 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2198 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic unihash changed to 7f034ccbf2e3a472258067090553acdf5027623371e9d57ad8b393541b371f26
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2199 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2200 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: Running task 2201 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: Running task 2206 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2207 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: Running task 2208 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2209 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2210 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2211 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2212 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_compile)
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2213 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2214 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2216 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2218 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2220 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2221 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: Running task 2222 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2223 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2224 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: Running task 2230 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: Running task 2231 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: Running task 2232 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2233 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: Running task 2234 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 2235 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: Running task 2237 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 2238 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2239 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2240 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: Running task 2241 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: Running task 2242 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2244 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 2245 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2246 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2247 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2249 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2250 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: Running task 2251 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2252 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2253 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2254 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2255 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: Running task 2256 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2257 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2259 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2260 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2261 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2262 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2263 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2265 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2266 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2267 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: Running task 2268 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2269 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2270 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Started
NOTE: Running task 2271 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2272 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2273 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: Running task 2274 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 2275 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: Running task 2276 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2277 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 2278 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: Running task 2279 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: Running task 2280 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2281 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2282 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2404 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Failed
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2283 tasks of which 1982 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata
Summary: There were 61 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libsecret/0.20.4-r0/temp/log.do_packagedata.3031074
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata) failed with exit code '1'

--===============0271274010287143895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
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
DISTRO_VERSION       = "3.4+snapshot-f5a35fff12da485d13fdb1810201f832111a4ceb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f5a35fff12da485d13fdb1810201f832111a4ceb"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 150 Local 3 Mirrors 0 Missed 147 Current 554 (2% match, 79% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 685 of 704 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1262 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe iso-codes-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1576 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_fetch)
NOTE: Running task 1670 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_fetch)
NOTE: Running task 1673 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1687 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1688 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_fetch)
NOTE: Running task 1691 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_fetch)
NOTE: Running task 1692 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_fetch)
NOTE: Running task 1723 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_fetch)
NOTE: Running task 1797 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_write_config)
NOTE: Running task 1798 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 1817 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_write_config)
NOTE: Running task 1822 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_write_config)
NOTE: Running task 1823 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_write_config)
NOTE: Running task 1827 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_write_config)
NOTE: Running task 1830 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 1835 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1836 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_fetch)
NOTE: Running task 1839 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1842 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1850 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1865 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_fetch)
NOTE: Running task 1873 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1874 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_fetch)
NOTE: Running task 1875 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1876 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_fetch)
NOTE: Running task 1877 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_fetch)
NOTE: Running task 1879 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_fetch)
NOTE: Running task 1880 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1881 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1882 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_fetch)
NOTE: Running task 1883 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Started
NOTE: Running task 1895 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_fetch)
NOTE: Running task 1896 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_fetch)
NOTE: Running task 1897 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_fetch)
NOTE: Running task 1898 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_fetch)
NOTE: Running task 1900 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_fetch)
NOTE: Running task 1901 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_fetch)
NOTE: Running task 1902 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_fetch)
NOTE: Running task 1903 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_fetch)
NOTE: Running task 1904 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_fetch)
NOTE: Running task 1905 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_fetch)
NOTE: Running task 1906 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1913 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_fetch)
NOTE: Running task 1918 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_write_config)
NOTE: Running task 1932 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_write_config)
NOTE: Running task 1935 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1958 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_write_config)
NOTE: Running task 1959 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_write_config)
NOTE: Running task 1960 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_write_config)
NOTE: Running task 1961 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_write_config)
NOTE: Running task 1964 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Started
NOTE: Running task 2008 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_unpack)
NOTE: Running task 2009 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Started
NOTE: Running task 2010 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Started
NOTE: Running task 2011 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2012 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2013 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_unpack)
NOTE: Running task 2014 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2015 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_unpack)
NOTE: Running task 2016 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 2017 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.4-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 2018 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2019 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2020 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2021 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_unpack)
NOTE: Running task 2022 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2023 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_write_config: Succeeded
NOTE: Running task 2024 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2025 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_unpack)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_unpack)
NOTE: Running task 2027 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Started
NOTE: Running task 2028 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2029 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2030 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_write_config: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Started
NOTE: Running task 2031 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_unpack)
NOTE: Running task 2032 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Started
NOTE: Running task 2033 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_unpack)
NOTE: Running task 2034 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2035 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Started
NOTE: Running task 2036 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2037 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_unpack)
NOTE: Running task 2038 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_fetch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: Running task 2039 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.7.9-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2040 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_unpack)
NOTE: Running task 2041 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_unpack)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2042 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Started
NOTE: Running task 2043 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2044 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_unpack)
NOTE: Running task 2045 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_unpack)
NOTE: Running task 2046 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_unpack)
NOTE: Running task 2047 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_unpack)
NOTE: Running task 2048 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_unpack)
NOTE: Running task 2049 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_unpack)
NOTE: Running task 2050 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_unpack)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Started
NOTE: Running task 2051 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.4-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Started
NOTE: Running task 2052 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_write_config: Succeeded
NOTE: Running task 2053 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2054 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_write_config: Succeeded
NOTE: Running task 2055 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2056 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2057 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_patch)
NOTE: Running task 2058 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2059 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Started
NOTE: Running task 2060 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2061 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2062 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 2063 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Started
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Started
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: Running task 2064 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_patch)
NOTE: Running task 2065 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2066 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Started
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2067 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2068 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2069 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2070 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_patch)
NOTE: Running task 2071 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_unpack: Succeeded
NOTE: Running task 2072 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libwebp-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 2074 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_patch)
NOTE: Running task 2075 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_patch)
NOTE: Running task 2076 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_patch)
NOTE: Running task 2077 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Started
NOTE: Running task 2078 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_patch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2079 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2080 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_patch)
NOTE: Running task 2081 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Started
NOTE: Running task 2082 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_patch)
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2083 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_patch)
NOTE: Running task 2084 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_patch)
NOTE: recipe libxslt-1.1.34-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2085 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_patch)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2086 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 2087 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Started
NOTE: Running task 2088 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2089 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2090 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2091 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_patch)
NOTE: Running task 2092 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_patch)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Started
NOTE: Running task 2093 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Started
NOTE: Running task 2094 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2095 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_patch: Succeeded
NOTE: Running task 2096 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/enchant/enchant2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2098 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Started
NOTE: recipe pango-1.50.4-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2100 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2102 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_generate_toolchain_file)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2103 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2104 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2105 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2106 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.4-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_patch: Succeeded
NOTE: Running task 2107 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2108 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2109 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2110 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2111 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2112 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2113 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2114 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.32-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2115 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_patch: Succeeded
NOTE: Running task 2116 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Started
NOTE: Running task 2117 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2118 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2119 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2120 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_patch: Succeeded
NOTE: Running task 2121 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2122 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2123 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxslt-1.1.34-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.7.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 2124 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2125 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_generate_toolchain_file)
NOTE: Running task 2126 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2127 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2128 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_configure)
NOTE: recipe libsoup-2.4-2.74.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2129 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2130 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_configure)
NOTE: recipe pango-1.50.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2131 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2132 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2133 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2134 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_patch)
NOTE: Running task 2135 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_configure)
NOTE: Running task 2136 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe orc-0.4.32-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Started
NOTE: Running task 2137 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_configure)
NOTE: Running task 2138 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Started
NOTE: Running task 2139 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Started
NOTE: Running task 2140 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_configure: Started
NOTE: recipe aspell-0.60.8-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2141 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2142 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_configure)
NOTE: recipe libtasn1-4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2143 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_configure)
NOTE: recipe libwpe-1.12.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2144 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_configure)
NOTE: Running task 2173 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2174 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Started
NOTE: Running task 2175 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2176 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Started
NOTE: Running task 2177 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2183 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2184 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2185 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_unpack: Succeeded
NOTE: Running task 2186 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2187 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_compile)
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 2188 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ccf80ab85788ecb5226596dc501d7d6f4b7e676e1efda46a8a0376aa879a5819
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.12.0-r0: task do_configure: Succeeded
NOTE: Running task 2201 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_compile)
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.32-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_compile)
NOTE: Running task 2204 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_compile)
NOTE: recipe orc-0.4.32-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2205 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Started
NOTE: Running task 2206 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure)
NOTE: recipe harfbuzz-3.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2207 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2208 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_configure)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2209 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.34.6-r0: task do_patch: Succeeded
NOTE: Running task 2211 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: Running task 2212 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2213 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_generate_toolchain_file)
NOTE: Running task 2214 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.34.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_populate_sysroot)
NOTE: Running task 2216 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_package)
NOTE: recipe webkitgtk-2.34.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb:do_populate_lic unihash changed to 7f034ccbf2e3a472258067090553acdf5027623371e9d57ad8b393541b371f26
NOTE: recipe webkitgtk-2.34.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.12.0-r0: task do_package: Started
NOTE: recipe libwpe-1.12.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2217 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2218 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_install)
NOTE: recipe orc-0.4.32-r0: task do_compile: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2219 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_install)
NOTE: Running task 2220 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.11-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe orc-0.4.32-r0: task do_install: Started
NOTE: recipe libsecret-0.20.4-r0: task do_configure: Succeeded
NOTE: Running task 2221 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_compile)
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.11-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 2223 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_package: Started
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Started
NOTE: Running task 2224 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_populate_sysroot)
NOTE: Running task 2225 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_package)
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.32-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2226 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe fribidi-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe orc-0.4.32-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.12.0-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.0.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-3.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2228 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_3.4.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2229 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_install)
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Started
NOTE: recipe fribidi-1.0.11-r0: task do_package: Succeeded
NOTE: Running task 2230 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.11.bb:do_packagedata)
NOTE: recipe libwpe-1.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_install: Succeeded
NOTE: Running task 2231 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_populate_sysroot)
NOTE: Running task 2232 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2233 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: Running task 2234 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe fribidi-1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.32-r0: task do_package: Succeeded
NOTE: Running task 2235 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.32.bb:do_packagedata)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.32-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2237 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2238 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb:do_compile)
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2242 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_package: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_compile: Succeeded
NOTE: Running task 2243 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_install)
NOTE: Running task 2244 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Started
NOTE: recipe libsecret-0.20.4-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libsecret-0.20.4-r0: task do_install: Succeeded
NOTE: Running task 2245 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_populate_sysroot)
NOTE: Running task 2246 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_package)
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 2247 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.2.2.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_configure: Succeeded
NOTE: Running task 2248 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_compile)
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_configure: Succeeded
NOTE: Running task 2249 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_compile)
NOTE: recipe aspell-0.60.8-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 2250 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb:do_compile)
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure: Succeeded
NOTE: Running task 2252 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 2253 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: Running task 2254 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2255 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libxv-1.0.11-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 2256 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 2257 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: Running task 2258 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: Running task 2260 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 2262 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 2263 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.11-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2264 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: Running task 2266 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2267 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2268 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: Running task 2270 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2271 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.11-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: Running task 2272 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2273 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2274 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2275 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2277 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: Running task 2278 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: Running task 2279 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.11-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: Running task 2280 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2281 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2282 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2283 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libxv-1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2284 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_compile: Succeeded
NOTE: Running task 2285 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_install)
NOTE: recipe libpsl-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2286 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpsl/libpsl_0.21.1.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2287 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: Running task 2288 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.34-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libsecret-0.20.4-r0: task do_package: Succeeded
NOTE: Running task 2289 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2290 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2291 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.42.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2292 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.42.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_install: Succeeded
NOTE: Running task 2293 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: Running task 2294 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_populate_sysroot)
NOTE: Running task 2295 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.34.bb:do_package)
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Started
NOTE: recipe libxslt-1.1.34-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_compile: Succeeded
NOTE: Running task 2296 of 2422 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/aspell/aspell_0.60.8.bb:do_install)
NOTE: recipe libsecret-0.20.4-r0: task do_packagedata: Failed
NOTE: recipe aspell-0.60.8-r0: task do_install: Started
NOTE: recipe libxslt-1.1.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.11-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: recipe wpebackend-fdo-1.12.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_install: Succeeded
NOTE: recipe libwebp-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.6-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.34-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.42.0-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.20.0-r0: task do_compile: Succeeded
NOTE: recipe libpsl-0.21.1-r0: task do_compile: Succeeded
NOTE: recipe alsa-lib-1.2.6.1-r0: task do_compile: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: recipe libtasn1-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-3.4.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2296 tasks of which 2000 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata
Summary: There were 61 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.20.5-r0 to 0:0.20.4-r0) [version-going-backwards]
ERROR: libsecret-0.20.4-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libsecret/0.20.4-r0/temp/log.do_packagedata.2670074
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb:do_packagedata) failed with exit code '1'

--===============0271274010287143895==--

