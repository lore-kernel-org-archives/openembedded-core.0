Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292ADC87FDD
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3769.1684186748262228448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SsoBkbrO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a5dd4-d65cc9ca-8ba6-413d-b8ff-2d01ba758516-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=n0OlRDryNzQRciCxgOMGYAWxtB3d2IdjA1bOj6KpBeU=;
	b=SsoBkbrO/oZ1OyczgzuUVWSUFHVYqPR2lKEgHKHQfqMERd6wLwJiYZbweDd35CNi
	B5IbF2dvRkvonGAAHSLdeR+TAvM3+m78mWtwkBFjtbung9lvIsDWTyUycRmyNct5D3D
	bsfQqNJO4p9XtiRT/8aqVscjsZqjdgEYJCX0+VsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=n0OlRDryNzQRciCxgOMGYAWxtB3d2IdjA1bOj6KpBeU=;
	b=P0JRrfU2NylVv0BNS0M6xEopG8etIIBlIINWUJpvNC9CrZdKLuAoiNnpBZbISCSj
	XeDq/JRlL6dMYXH5DbpXNvuNGvnjyduMkJPXgGOSnsP1m7eXRsYKc3KKWwzO+4EkMYS
	7wZEKFi1QbTJZ2Zm0e+mmeoDc2qLtb8PW4h7dCeg=
Content-Type: multipart/mixed; boundary="===============8195387508821233023=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xf86-input-libinput: upgrading to 1.3.0 SUCCEEDED
Message-ID: <01010188215a5dd4-d65cc9ca-8ba6-413d-b8ff-2d01ba758516-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181369

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xf86-input-libinput* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch
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
--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 51 skipped, 0 masked, 0 errors.
Removing 83 recipes from the core2-32 sysroot...done.
Removing 82 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1800e71a17cef1489a24c8c16d5876db7e4b4235"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 306 Local 263 Mirrors 0 Missed 43 Current 183 (85% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 201 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 216 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 221 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 755 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 756 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 757 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 773 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 811 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 822 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 852 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 853 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 854 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 900 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 901 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 902 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 905 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 259 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 923 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running setscene task 273 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 924 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running setscene task 274 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 276 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 929 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 935 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 936 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 937 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 938 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: Running task 939 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 940 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: Running task 941 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 942 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 943 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: Running task 944 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 956 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 960 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 962 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: Running setscene task 291 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 968 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: Running task 973 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 974 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 975 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: Running task 976 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 977 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 978 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 979 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 980 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 985 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 312 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 3e85416d0b035f8d9998ac745b565f4ee09e47d4d0618a5117e9037c1ac53232
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running setscene task 316 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: Running task 1008 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1009 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 331 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.682293
NOTE: Running task 1014 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 333 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running task 1040 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 379 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 489 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1514 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1556 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1606 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: Running task 1614 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1615 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1655 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 1656 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1663 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1664 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1665 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1666 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1667 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1668 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1669 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1671 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1672 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1674 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1675 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1676 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1678 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1679 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1680 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1681 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1683 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1684 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1685 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1686 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1687 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1688 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1689 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1690 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1691 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1692 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1693 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1694 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1695 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1696 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1697 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1699 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1700 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1701 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1703 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1704 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1705 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1706 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1707 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 1708 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1709 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1710 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1711 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1712 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1713 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1714 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1715 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1716 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1717 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1718 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1720 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1721 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1722 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1723 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1724 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1725 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1726 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1727 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1728 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1729 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1730 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1731 of 1731 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1731 tasks of which 1610 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 73 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1800e71a17cef1489a24c8c16d5876db7e4b4235"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 38 Mirrors 0 Missed 43 Current 479 (46% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 492 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.637141
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 559 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1377 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1378 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1415 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1503 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1573 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1597 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1654 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1655 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1657 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1732 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: Running task 1733 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1734 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1735 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1736 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1773 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1780 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1807 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1834 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1835 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: Running task 1836 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1837 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: Running task 1838 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 1839 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1840 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1842 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: Running task 1843 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1844 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 1845 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1847 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 1850 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1872 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: Running task 1877 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: Running task 1883 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1884 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1885 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1889 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1890 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1898 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 3e85416d0b035f8d9998ac745b565f4ee09e47d4d0618a5117e9037c1ac53232
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1899 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1907 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1911 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1913 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1915 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1917 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1925 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1934 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1937 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1938 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1939 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1941 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1942 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1944 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1945 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 1946 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1955 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1956 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1957 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1958 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1959 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1965 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1968 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1969 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1969 tasks of which 1848 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 57 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1800e71a17cef1489a24c8c16d5876db7e4b4235"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 38 Mirrors 0 Missed 43 Current 479 (46% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 492 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.552624
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 559 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1376 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1378 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1415 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1503 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1573 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1597 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1653 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1656 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1657 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1732 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1769 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1776 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1778 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1779 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1780 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1781 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1807 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1835 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1837 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1838 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1839 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1840 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1842 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1843 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1844 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1845 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1846 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1847 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 1850 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1851 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1852 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1853 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1854 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1875 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1877 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1880 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1885 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1887 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 1890 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1891 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 3e85416d0b035f8d9998ac745b565f4ee09e47d4d0618a5117e9037c1ac53232
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1893 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1894 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: Running task 1901 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1907 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1911 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1913 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1915 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1917 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1925 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1934 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1937 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1938 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1939 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1941 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1942 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1944 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1945 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 1946 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1955 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1956 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1957 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1958 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1959 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1965 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1968 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1969 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1969 tasks of which 1848 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput: SRC_URI changed from "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.2.1.tar.xz" to "https://www.x.org/releases//individual/driver/xf86-input-libinput-1.3.0.tar.xz"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dbg: PKGSIZE changed from 213684 to 233984 (+10%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-dev: PKGSIZE changed from 9974 to 10867 (+9%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-doc: PKGSIZE changed from 17951 to 19140 (+7%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-locale: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: FILELIST: removed "/usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.h /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.2.1-r0/src/xf86libinput.c", added "/usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/bezier.c /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/util-strings.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/draglock.h /usr/src/debug/xf86-input-libinput/2_1.3.0-r0/src/xf86libinput.c"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-staticdev: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGV changed from 1.2.1 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PV changed from "1.2.1" to "1.3.0"
packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput: PKGSIZE changed from 90033 to 98289 (+9%)

--===============8195387508821233023==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xf86-input-libinput-upgrade-1.2.1-1.3.0.patch"

RnJvbSAxNDEwYTg0YmYzNjlhYTc5ODJkOGEyYWViZmFjZGEzMTIwZTgwMzE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6Mzg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
Zjg2LWlucHV0LWxpYmlucHV0OiB1cGdyYWRlIDEuMi4xIC0+IDEuMy4wCgotLS0KIC4uLmY4Ni1p
bnB1dC1saWJpbnB1dF8xLjIuMS5iYiA9PiB4Zjg2LWlucHV0LWxpYmlucHV0XzEuMy4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci97eGY4Ni1pbnB1dC1saWJpbnB1
dF8xLjIuMS5iYiA9PiB4Zjg2LWlucHV0LWxpYmlucHV0XzEuMy4wLmJifSAoNzclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlu
cHV0XzEuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5w
dXQtbGliaW5wdXRfMS4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctZHJpdmVyL3hmODYtaW5wdXQtbGliaW5wdXRfMS4yLjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0
LWxpYmlucHV0XzEuMy4wLmJiCmluZGV4IGUxYzQ3YWE1ZTcuLjg5MjA0NmU5NTkgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlucHV0LWxpYmlucHV0
XzEuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWRyaXZlci94Zjg2LWlu
cHV0LWxpYmlucHV0XzEuMy4wLmJiCkBAIC03LDYgKzcsNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT1hMjI5MjUxMjdiZDNjODI3YzM4NGNlZGQyM2VkMjMwOSIKIERF
UEVORFMgKz0gImxpYmlucHV0IgogCiBYT1JHX0RSSVZFUl9DT01QUkVTU09SID0gIi50YXIueHoi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODE1MWRiNWI5ZGRiMzE3YzBjZTkyZGNiNjJkYTlhOGRi
NTA3OWU1YjhhOTViNjBhYmM4NTRkYTIxZTdlOTcxYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIx
NDQ2YmEyMGEyMmJjOTY4YjVhNGEwYjRkYmMzYjhlMDM3YzUwZDljNTlhYzc1ZmEzZjdmYzUwNmM1
OGMxYWJiIgogCiBGSUxFUzoke1BOfSArPSAiJHtkYXRhZGlyfS9YMTEveG9yZy5jb25mLmQiCi0t
IAoyLjM5LjIKCg==

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (0 cached, 900 parsed). 1804 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1800e71a17cef1489a24c8c16d5876db7e4b4235"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 38 Mirrors 0 Missed 43 Current 475 (46% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 488 of 556 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 556 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 556 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.594865
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 555 of 556 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1367 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1368 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1404 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1491 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1561 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1585 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1641 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1642 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 1644 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: Running task 1720 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 1759 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1764 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1765 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1766 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1767 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1793 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1820 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1821 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 1823 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1824 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1825 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1826 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1828 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: Running task 1829 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1830 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 1831 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: Running task 1832 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1833 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 1834 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Running task 1837 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1839 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1840 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: Running task 1863 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1869 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1870 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1872 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1873 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1874 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 3e85416d0b035f8d9998ac745b565f4ee09e47d4d0618a5117e9037c1ac53232
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1879 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: Running task 1887 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1888 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1889 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1890 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1892 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1893 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1894 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1895 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1897 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1898 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1899 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1901 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1902 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1903 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1911 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1912 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1913 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1914 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1915 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1916 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1918 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1919 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1920 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1924 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1925 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1926 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1928 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1929 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1930 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1931 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 1932 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1933 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1934 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1935 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1936 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1937 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1939 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1940 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1941 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1942 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1943 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1944 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1945 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1946 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1951 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1952 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1953 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1954 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1955 of 1955 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1955 tasks of which 1834 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/xf86-input-libinput/xf86-input-libinput-src: PKGSIZE changed from 182206 to 210863 (+16%)

--===============8195387508821233023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1804 targets, 39 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:1800e71a17cef1489a24c8c16d5876db7e4b4235"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 81 Local 38 Mirrors 0 Missed 43 Current 479 (46% match, 92% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 492 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.243.0-r0/temp/log.do_packagedata_setscene.510073
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 559 of 560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_package_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1376 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1378 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_fetch)
NOTE: Running task 1415 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_fetch)
NOTE: Running task 1503 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_fetch)
NOTE: Running task 1573 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_write_config)
NOTE: Running task 1597 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 1653 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 1654 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 1655 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_fetch)
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Started
NOTE: Running task 1740 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 1741 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_unpack)
NOTE: Running task 1742 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1743 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Started
NOTE: Running task 1773 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_fetch)
NOTE: Running task 1775 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1807 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_write_config)
NOTE: recipe font-util-1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_unpack)
NOTE: Running task 1835 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe libinput-1.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Started
NOTE: Running task 1837 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_unpack)
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: Running task 1838 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: Running task 1839 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 1840 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libinput-1.23.0-r0: task do_write_config: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_unpack)
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1842 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_unpack)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Started
NOTE: Running task 1843 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 1844 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1845 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1846 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_patch)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: Running task 1847 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_patch)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1850 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_package_setscene: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1872 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata)
NOTE: Running task 1877 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.0-r0: task do_patch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1880 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1883 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1884 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1885 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1886 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: recipe libinput-1.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_patch)
NOTE: recipe libevdev-1.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1889 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_configure)
NOTE: Running task 1890 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: recipe font-util-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_lic: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_unpack: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1897 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_patch)
NOTE: Running task 1898 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_lic unihash changed to 3e85416d0b035f8d9998ac745b565f4ee09e47d4d0618a5117e9037c1ac53232
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_patch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1899 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: Running task 1900 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe font-util-1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Started
NOTE: recipe libinput-1.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 1907 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1909 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe font-util-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1911 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_install)
NOTE: recipe font-util-1.4.0-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1913 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_package)
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.4.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe font-util-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1915 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 1917 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1918 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.0.bb:do_packagedata)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1920 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_compile)
NOTE: recipe font-util-1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1922 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1923 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe libevdev-1.13.0-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_populate_sysroot)
NOTE: Running task 1925 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_package)
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.0-r0: task do_package: Started
NOTE: recipe libevdev-1.13.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1927 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 1928 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 1929 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1930 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure)
NOTE: recipe libinput-1.23.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libevdev-1.13.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.13.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 1932 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1934 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile)
NOTE: recipe libinput-1.23.0-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 1936 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 1937 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 1938 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1939 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile: Succeeded
NOTE: Running task 1941 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1942 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install)
NOTE: recipe libinput-1.23.0-r0: task do_install: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_install: Succeeded
NOTE: Running task 1944 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_install_ptest_base)
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.23.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1945 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_populate_sysroot)
NOTE: Running task 1946 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_package)
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.23.0-r0: task do_package: Started
NOTE: recipe libinput-1.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libinput-1.23.0-r0: task do_package: Succeeded
NOTE: Running task 1947 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb:do_packagedata)
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Started
NOTE: recipe libinput-1.23.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_configure: Succeeded
NOTE: Running task 1955 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_compile: Succeeded
NOTE: Running task 1956 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_install: Succeeded
NOTE: Running task 1957 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_populate_sysroot)
NOTE: Running task 1958 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_package)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1959 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.8-r0: task do_packagedata: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package)
NOTE: Running task 1965 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_populate_sysroot)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 1966 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1967 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_write_rpm)
NOTE: Running task 1968 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe xf86-input-libinput-2_1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1969 of 1969 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1969 tasks of which 1848 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.246.1-r0 to 0:1.3.243.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.243.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8195387508821233023==--

