Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A21C32768
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3938.1659679408318690253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RvjXR3Rh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c9a0041-0803b9a7-3bc7-465c-a22d-5d50149f9186-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l6twCGLth1sGtxxTVLHX9yR6aF/aloLdTWOdcTlZs24=;
	b=RvjXR3Rhbz8bS35yHRM/jJvbuYpmi9lgEZTj7EjfF4RlQl1b23BpFYVhmYXj2up+
	nQW91eT60frTiH4zNoNSXmGSPpe1tOHipga7v1BTWH3j3E6nEgmc7PUULM5E/Bdctc6
	Aw2DwJmSdHt4AHKoTKCNvb/OcAdrNbf0/8YfdYY0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l6twCGLth1sGtxxTVLHX9yR6aF/aloLdTWOdcTlZs24=;
	b=NRTkyQGFMMazkmTH95nF1ZBLgwxZMcOYt87cK1uHExmHtk6RMgn4FJ6uDPeimDsd
	vk0in56n8rlJ5vM5lml6NT19VKTlt9bCzkq0erStLH2alkCN/sUEV0GhuEhdnDbNIP4
	NPzNBVo8u+uzLa6yfmAEndas7cIN0QSPJ74kh8WQ=
Content-Type: multipart/mixed; boundary="===============8672960656936715243=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 10.0.2 SUCCEEDED
Message-ID: 
 <010101826c9a0041-0803b9a7-3bc7-465c-a22d-5d50149f9186-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168907

--===============8672960656936715243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *10.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-10.0.1-10.0.2.patch
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
--===============8672960656936715243==
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
DISTRO_VERSION       = "4.1+snapshot-972c014fe0a909129f13b51969266bcbbcea03c7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:972c014fe0a909129f13b51969266bcbbcea03c7"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 104 Local 15 Mirrors 0 Missed 89 Current 535 (14% match, 86% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 541 of 639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 608 of 639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.6.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 639 of 639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe encodings-1_1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1518 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: Running task 1579 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: Running task 1580 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_fetch)
NOTE: Running task 1581 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_fetch)
NOTE: Running task 1582 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_fetch)
NOTE: Running task 1583 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_fetch)
NOTE: Running task 1624 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_fetch)
NOTE: Running task 1626 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_fetch)
NOTE: Running task 1813 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_write_config)
NOTE: Running task 1814 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_write_config)
NOTE: Running task 1840 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_write_config)
NOTE: Running task 1842 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_write_config)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: Running task 1866 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_fetch)
NOTE: Running task 1889 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_fetch)
NOTE: Running task 1898 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_fetch)
NOTE: Running task 1899 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_fetch)
NOTE: Running task 1913 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_fetch)
NOTE: Running task 1921 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_fetch)
NOTE: Running task 1922 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_fetch)
NOTE: Running task 1923 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1963 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_fetch)
NOTE: Running task 1969 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_write_config)
NOTE: Running task 1971 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_fetch)
NOTE: Running task 1972 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_fetch)
NOTE: Running task 1976 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_write_config)
NOTE: Running task 1977 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_write_config)
NOTE: Running task 1984 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_write_config)
NOTE: Running task 1991 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_fetch)
NOTE: Running task 1992 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_fetch)
NOTE: Running task 1993 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_write_config)
NOTE: Running task 2001 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package_write_rpm)
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libevdev-1.12.1-r0: task do_fetch: Started
NOTE: recipe libevdev-1.12.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libinput-1.19.4-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Started
NOTE: Running task 2003 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.19.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_fetch: Started
NOTE: Running task 2004 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 2005 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_unpack)
NOTE: Running task 2006 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_unpack)
NOTE: Running task 2007 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_unpack)
NOTE: Running task 2008 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_unpack)
NOTE: Running task 2009 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_unpack)
NOTE: recipe libinput-1.19.4-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2010 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2011 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2012 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2013 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_write_config: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Started
NOTE: Running task 2014 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe pango-1.50.8-r0: task do_write_config: Started
NOTE: recipe font-util-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Started
NOTE: Running task 2015 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_unpack)
NOTE: Running task 2016 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_fetch: Started
NOTE: recipe libinput-1.19.4-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_fetch: Succeeded
NOTE: Running task 2017 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2018 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_unpack)
NOTE: Running task 2019 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_unpack)
NOTE: recipe weston-init-1.0-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Started
NOTE: Running task 2020 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Started
NOTE: Running task 2021 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.3-r0: task do_fetch: Started
NOTE: recipe weston-10.0.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Started
NOTE: recipe pango-1.50.8-r0: task do_write_config: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_write_config: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_fetch: Started
NOTE: recipe xwayland-22.1.3-r0: task do_fetch: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_write_config: Started
NOTE: recipe kbd-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2022 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_unpack)
NOTE: Running task 2023 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_write_rpm: Started
NOTE: Running task 2024 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_unpack)
NOTE: Running task 2025 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_fetch: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xwayland-22.1.3-r0: task do_write_config: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_write_config: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_write_config: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_write_config: Succeeded
NOTE: recipe xwayland-22.1.3-r0: task do_write_config: Succeeded
NOTE: Running task 2026 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_unpack)
NOTE: Running task 2027 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_unpack)
NOTE: Running task 2028 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2029 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libevdev-1.12.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Started
NOTE: Running task 2030 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2031 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2032 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_unpack)
NOTE: Running task 2033 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_unpack)
NOTE: Running task 2034 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_unpack)
NOTE: Running task 2035 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.19.4-r0: task do_unpack: Started
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 2036 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: recipe libevdev-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2037 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.8-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Started
NOTE: Running task 2038 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_patch)
NOTE: Running task 2039 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Started
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Started
NOTE: Running task 2040 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_patch)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libinput-1.19.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe weston-10.0.2-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.3-r0: task do_unpack: Started
NOTE: recipe weston-init-1.0-r0: task do_unpack: Started
NOTE: Running task 2041 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Started
NOTE: recipe kbd-2.5.1-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: Running task 2042 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_patch)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libevdev-1.12.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2043 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_patch)
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Started
NOTE: Running task 2044 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_patch)
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2045 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_patch)
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_unpack: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2046 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_patch)
NOTE: Running task 2047 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_patch)
NOTE: recipe libinput-1.19.4-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2048 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe weston-init-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2049 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_patch)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 2050 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2051 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_patch)
NOTE: recipe font-util-1.3.3-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xwayland-22.1.3-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2052 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_patch)
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2053 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_patch: Started
NOTE: recipe weston-10.0.2-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2054 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2055 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2056 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_patch)
NOTE: recipe libxfont2-2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_patch)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2058 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2059 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2060 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2061 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_patch)
NOTE: Running task 2062 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2063 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.19.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2064 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xwayland-22.1.3-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2065 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2066 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe seatd-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2067 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2068 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_patch: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2069 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_patch: Started
NOTE: recipe xwayland-22.1.3-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2070 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe kbd-2.5.1-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libinput-1.19.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_patch: Started
NOTE: Running task 2071 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2072 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2073 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_populate_lic)
NOTE: Running task 2074 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_configure)
NOTE: recipe libxcvt-0.1.1-r0: task do_unpack: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2075 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_patch)
NOTE: recipe xwayland-22.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2076 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.50.8-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2077 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_deploy_source_date_epoch)
NOTE: recipe seatd-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2078 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2079 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_patch: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.12.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Started
NOTE: recipe weston-10.0.2-r0: task do_populate_lic: Started
NOTE: recipe fribidi-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2081 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_configure)
NOTE: Running task 2082 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2083 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_configure)
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2084 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_configure)
NOTE: recipe libinput-1.19.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2085 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Started
NOTE: Running task 2086 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe font-util-1.3.3-r0: task do_configure: Started
NOTE: recipe xwayland-22.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe weston-10.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Started
NOTE: recipe weston-10.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_10.0.2.bb:do_populate_lic unihash changed to 9c25267811ec055588a4b91cfcb40bfe91f3b02814726fa92386990e557196b9
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0cb395d3538a9407268bc0b3afe0fcee44c439360721ee60d8257140abbfcb76
NOTE: Running task 2098 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kbd-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2101 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2102 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 2103 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_configure)
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2104 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_patch)
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kbd-2.5.1-r0: task do_configure: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_patch: Started
NOTE: Running task 2105 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_configure)
NOTE: recipe harfbuzz-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 2106 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe weston-init-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2107 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2108 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_configure)
NOTE: Running task 2109 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe weston-init-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_configure: Started
NOTE: recipe weston-init-1.0-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2111 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_configure)
NOTE: recipe weston-init-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 363e0d1bb995f81bceb8d8e9d6d721c4c6eec23d0d2d5e0a2bbfe50c79d95211
NOTE: recipe weston-init-1.0-r0: task do_install: Started
NOTE: recipe weston-init-1.0-r0: task do_install: Succeeded
NOTE: Running task 2117 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_package)
NOTE: recipe weston-init-1.0-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2118 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_compile)
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_compile)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2120 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_configure: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Started
NOTE: Running task 2121 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_compile)
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Started
NOTE: recipe seatd-0.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2122 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_compile)
NOTE: recipe seatd-0.7.0-r0: task do_compile: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2123 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_package)
NOTE: Running task 2124 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_populate_sysroot)
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_compile: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Started
NOTE: Running task 2125 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_install)
NOTE: recipe seatd-0.7.0-r0: task do_install: Started
NOTE: recipe libxcvt-0.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_package: Succeeded
NOTE: Running task 2126 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston-init.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_compile: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Started
NOTE: Running task 2127 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_install: Succeeded
NOTE: recipe weston-init-1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2128 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_populate_sysroot)
NOTE: Running task 2129 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_package)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2130 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 2131 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_package)
NOTE: recipe libxcvt-0.1.1-r0: task do_package: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.12-r0: task do_package: Started
NOTE: Running task 2132 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb:do_packagedata)
NOTE: recipe seatd-0.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcvt-0.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2133 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe font-util-1.3.3-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2135 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_compile)
NOTE: recipe harfbuzz-4.4.1-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2136 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_install)
NOTE: recipe fribidi-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 2137 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_install: Started
NOTE: recipe seatd-0.7.0-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/seatd/seatd_0.7.0.bb:do_packagedata)
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Started
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe seatd-0.7.0-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2139 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe font-util-1.3.3-r0: task do_install: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: Running task 2140 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 2141 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_package)
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe font-util-1.3.3-r0: task do_package: Started
NOTE: recipe font-util-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2142 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2143 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2144 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: Running task 2145 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_configure)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 2146 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.3.3.bb:do_packagedata)
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libevdev-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2147 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_compile)
NOTE: recipe libevdev-1.12.1-r0: task do_compile: Started
NOTE: recipe font-util-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: Running task 2148 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2149 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_compile)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Started
NOTE: recipe libevdev-1.12.1-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_install)
NOTE: Running task 2151 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libevdev-1.12.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Started
NOTE: Running task 2152 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libevdev-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2153 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_populate_sysroot)
NOTE: Running task 2154 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2155 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_install)
NOTE: recipe libevdev-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.12.1-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_install)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2157 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_install)
NOTE: recipe libevdev-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_install: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Started
NOTE: Running task 2158 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_populate_sysroot)
NOTE: Running task 2159 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_package)
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2160 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 2161 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_package)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2162 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2163 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Started
NOTE: Running task 2164 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2165 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_compile)
NOTE: recipe kbd-2.5.1-r0: task do_compile: Started
NOTE: recipe libevdev-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2166 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.12.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2167 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libevdev-1.12.1-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_compile: Succeeded
NOTE: Running task 2168 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2169 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_configure)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2171 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb:do_packagedata)
NOTE: Running task 2172 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_package)
NOTE: Running task 2175 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_populate_sysroot)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2176 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2177 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2178 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.19.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2179 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_compile)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_package: Succeeded
NOTE: recipe kbd-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2180 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb:do_packagedata)
NOTE: Running task 2181 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_install)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_compile: Succeeded
NOTE: recipe libinput-1.19.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2182 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_install)
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Started
NOTE: Running task 2183 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_configure)
NOTE: recipe kbd-2.5.1-r0: task do_install: Started
NOTE: recipe libinput-1.19.4-r0: task do_configure: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.9-r0: task do_packagedata: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2184 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 2185 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: Running task 2186 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe libfontenc-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2187 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2188 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_configure)
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Started
NOTE: recipe kbd-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_package)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2190 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.4.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe kbd-2.5.1-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkbcomp-1.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2191 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_compile)
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Started
NOTE: recipe libinput-1.19.4-r0: task do_configure: Succeeded
NOTE: Running task 2192 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.19.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.19.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2193 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_compile)
NOTE: recipe libinput-1.19.4-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2194 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 2195 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_package)
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Started
NOTE: recipe xkbcomp-1.4.5-r0: task do_package: Succeeded
NOTE: Running task 2196 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.5.bb:do_packagedata)
NOTE: recipe libinput-1.19.4-r0: task do_compile: Succeeded
NOTE: Running task 2197 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_compile_ptest_base)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Started
NOTE: recipe libinput-1.19.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.19.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2198 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_install)
NOTE: recipe xkbcomp-1.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.19.4-r0: task do_install: Started
NOTE: recipe kbd-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 2199 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.5.1.bb:do_packagedata)
NOTE: recipe kbd-2.5.1-r0: task do_packagedata: Started
NOTE: recipe libinput-1.19.4-r0: task do_install: Succeeded
NOTE: Running task 2200 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_install_ptest_base)
NOTE: recipe libinput-1.19.4-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.19.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2201 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_populate_sysroot)
NOTE: Running task 2202 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_package)
NOTE: recipe kbd-2.5.1-r0: task do_packagedata: Succeeded
NOTE: recipe libinput-1.19.4-r0: task do_populate_sysroot: Started
NOTE: recipe libinput-1.19.4-r0: task do_package: Started
NOTE: recipe libinput-1.19.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2203 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_compile)
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Started
NOTE: recipe libinput-1.19.4-r0: task do_package: Succeeded
NOTE: Running task 2204 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.19.4.bb:do_packagedata)
NOTE: recipe libinput-1.19.4-r0: task do_packagedata: Started
NOTE: recipe libinput-1.19.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2205 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_install)
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2206 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_package)
NOTE: Running task 2207 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_populate_sysroot)
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2208 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xwayland-22.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2209 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_configure)
NOTE: Running task 2210 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb:do_packagedata)
NOTE: recipe xwayland-22.1.3-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2211 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_install)
NOTE: recipe harfbuzz-4.4.1-r0: task do_install: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_install: Succeeded
NOTE: Running task 2212 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_populate_sysroot)
NOTE: Running task 2213 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_package)
NOTE: recipe harfbuzz-4.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_package: Started
NOTE: recipe xwayland-22.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2214 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_compile)
NOTE: recipe harfbuzz-4.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2215 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe xwayland-22.1.3-r0: task do_compile: Started
NOTE: recipe pango-1.50.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.50.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2216 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.8.bb:do_configure)
NOTE: recipe pango-1.50.8-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_package: Succeeded
NOTE: Running task 2217 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_packagedata)
NOTE: recipe xwayland-22.1.3-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-4.4.1-r0: task do_packagedata: Started
NOTE: Running task 2218 of 2240 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xwayland/xwayland_22.1.3.bb:do_install)
NOTE: recipe xwayland-22.1.3-r0: task do_install: Started
NOTE: recipe harfbuzz-4.4.1-r0: task do_packagedata: Failed
NOTE: recipe xwayland-22.1.3-r0: task do_install: Succeeded
NOTE: recipe pango-1.50.8-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2218 tasks of which 1987 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:5.1.0-r0 to 0:4.4.1-r0) [version-going-backwards]
ERROR: harfbuzz-4.4.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/4.4.1-r0/temp/log.do_packagedata.2375088
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb:do_packagedata) failed with exit code '1'

--===============8672960656936715243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/weston/libweston-10: FILELIST: removed "/usr/lib/libweston-10.so.0.0.1 /usr/lib/libweston-desktop-10.so.0.0.1", added "/usr/lib/libweston-10.so.0.0.2 /usr/lib/libweston-desktop-10.so.0.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-10.so.0 changed symlink target from libweston-10.so.0.0.1 to libweston-10.so.0.0.2
  /usr/lib/libweston-desktop-10.so.0 changed symlink target from libweston-desktop-10.so.0.0.1 to libweston-desktop-10.so.0.0.2
  /usr/lib/libweston-10.so.0.0.1 moved to /usr/lib/libweston-10.so.0.0.2
  /usr/lib/libweston-desktop-10.so.0.0.1 moved to /usr/lib/libweston-desktop-10.so.0.0.2

--===============8672960656936715243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/weston: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/10.0.1/downloads/weston-10.0.1.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/10.0.2/downloads/weston-10.0.2.tar.xz file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-32-poky-linux/weston/libweston-10: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/libweston-10: FILELIST: removed "/usr/lib/libweston-desktop-10.so.0.0.1 /usr/lib/libweston-10.so.0.0.1", added "/usr/lib/libweston-10.so.0.0.2 /usr/lib/libweston-desktop-10.so.0.0.2"
packages/core2-32-poky-linux/weston/libweston-10: PV changed from "10.0.1" to "10.0.2"
Changes to packages/core2-32-poky-linux/weston (sysroot):
  /usr/lib/libweston-10.so.0 changed symlink target from libweston-10.so.0.0.1 to libweston-10.so.0.0.2
  /usr/lib/libweston-desktop-10.so.0 changed symlink target from libweston-desktop-10.so.0.0.1 to libweston-desktop-10.so.0.0.2
  /usr/lib/libweston-10.so.0.0.1 moved to /usr/lib/libweston-10.so.0.0.2
  /usr/lib/libweston-desktop-10.so.0.0.1 moved to /usr/lib/libweston-desktop-10.so.0.0.2
packages/core2-32-poky-linux/weston/weston-dbg: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-desktop-10.so.0.0.1 /usr/lib/.debug/libweston-10.so.0.0.1", added "/usr/lib/.debug/libweston-desktop-10.so.0.0.2 /usr/lib/.debug/libweston-10.so.0.0.2"
packages/core2-32-poky-linux/weston/weston-dbg: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-dev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-dev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-doc: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-doc: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-examples: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-examples: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-locale: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-locale: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-src: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-src: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-staticdev: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-staticdev: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston-xwayland: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston-xwayland: PV changed from "10.0.1" to "10.0.2"
packages/core2-32-poky-linux/weston/weston: PKGV changed from 10.0.1 [default] to 10.0.2 [default]
packages/core2-32-poky-linux/weston/weston: PV changed from "10.0.1" to "10.0.2"

--===============8672960656936715243==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-10.0.1-10.0.2.patch"

RnJvbSBlNTVjNzNiZTliZjVkYjRmMWUxNTMxNzJkNjU1ODgzNDQyYTdjNzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMjoyNzozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMC4wLjEgLT4gMTAuMC4yCgotLS0KIC4uLi9maWxlcy9kb250LXVzZS1w
bGFuZS1hZGQtcHJvcC5wYXRjaCAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysKIC4uLi97
d2VzdG9uXzEwLjAuMS5iYiA9PiB3ZXN0b25fMTAuMC4yLmJifSAgICB8ICAyICstCiAyIGZpbGVz
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9maWxlcy9kb250LXVzZS1wbGFuZS1h
ZGQtcHJvcC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0
b25fMTAuMC4xLmJiID0+IHdlc3Rvbl8xMC4wLjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvZmlsZXMvZG9udC11c2UtcGxhbmUtYWRkLXByb3Au
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9maWxlcy9kb250LXVzZS1wbGFu
ZS1hZGQtcHJvcC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44
NmJlZDM4N2VlCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxh
bmQvZmlsZXMvZG9udC11c2UtcGxhbmUtYWRkLXByb3AucGF0Y2gKQEAgLTAsMCArMSwzMiBAQAor
RnJvbSBlNGQxNDZmNjFjNjBhMmVjOTMwMGUzZjE2Y2M4YjVkOWU0M2VhNWQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6
IFNhdCwgMTIgU2VwIDIwMjAgMTQ6MDQ6MDQgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGF0
b21pYyBtb2Rlc2V0dGluZyB3aXRoIG11c2wKKworYXRvbWljIG1vZGVzZXR0aW5nIHNlZW1zIHRv
IGZhaWwgd2l0aCBkcm0gd2VzdG9uIGJhY2tlbmQgYW5kIHRoaXMgcGF0Y2ggZml4ZXMKK2l0LCBi
ZWxvdyBlcnJvcnMgYXJlIHNlZW4gYmVmb3JlIHdlc3RvbiBleGl0cworCithdG9taWM6IGNvdWxk
bid0IGNvbW1pdCBuZXcgc3RhdGU6IEludmFsaWQgYXJndW1lbnQKKworVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93YXlsYW5kL3dlc3Rv
bi8tL2lzc3Vlcy8xNThdCitTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgorCistLS0KKyBsaWJ3ZXN0b24vYmFja2VuZC1kcm0va21zLmMgfCA0ICsrLS0KKyAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0
IGEvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2ttcy5jIGIvbGlid2VzdG9uL2JhY2tlbmQtZHJtL2tt
cy5jCitpbmRleCA3ODBkMDA3Li45OTk0ZGExIDEwMDY0NAorLS0tIGEvbGlid2VzdG9uL2JhY2tl
bmQtZHJtL2ttcy5jCisrKysgYi9saWJ3ZXN0b24vYmFja2VuZC1kcm0va21zLmMKK0BAIC0xMTQy
LDggKzExNDIsOCBAQCBkcm1fcGVuZGluZ19zdGF0ZV9hcHBseV9hdG9taWMoc3RydWN0IGRybV9w
ZW5kaW5nX3N0YXRlICpwZW5kaW5nX3N0YXRlLAorIAkJd2xfbGlzdF9mb3JfZWFjaChwbGFuZSwg
JmItPnBsYW5lX2xpc3QsIGxpbmspIHsKKyAJCQlkcm1fZGVidWcoYiwgIlx0XHRbYXRvbWljXSBz
dGFydGluZyB3aXRoIHBsYW5lICVsdSBkaXNhYmxlZFxuIiwKKyAJCQkJICAodW5zaWduZWQgbG9u
ZykgcGxhbmUtPnBsYW5lX2lkKTsKKy0JCQlwbGFuZV9hZGRfcHJvcChyZXEsIHBsYW5lLCBXRFJN
X1BMQU5FX0NSVENfSUQsIDApOworLQkJCXBsYW5lX2FkZF9wcm9wKHJlcSwgcGxhbmUsIFdEUk1f
UExBTkVfRkJfSUQsIDApOworKwkJCS8vcGxhbmVfYWRkX3Byb3AocmVxLCBwbGFuZSwgV0RSTV9Q
TEFORV9DUlRDX0lELCAwKTsKKysJCQkvL3BsYW5lX2FkZF9wcm9wKHJlcSwgcGxhbmUsIFdEUk1f
UExBTkVfRkJfSUQsIDApOworIAkJfQorIAorIAkJZmxhZ3MgfD0gRFJNX01PREVfQVRPTUlDX0FM
TE9XX01PREVTRVQ7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
ZXN0b25fMTAuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEw
LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTAuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mvd2F5bGFuZC93ZXN0b25fMTAuMC4yLmJiCmluZGV4IGUyN2RhYzE2NGUuLmIwYTJhZTQw
MWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rvbl8xMC4w
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEwLjAuMi5i
YgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy93YXlsYW5kL3dlc3Rvbi8tL3JlbGVhc2VzLyR7UFZ9L2Rvd25sbwogCiBTUkNfVVJJOmFw
cGVuZDpsaWJjLW11c2wgPSAiIGZpbGU6Ly9kb250LXVzZS1wbGFuZS1hZGQtcHJvcC5wYXRjaCAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YTllNTI1MDZhODY1YTc0MTA5ODFiMDRmODM0MWI4
OWI4NDEwNmRiODUzMWFiMWY5ZmRkMzdiNWRjMDM0MTE1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijg5NjQ2Y2EwZDlmOGQ0MTNjMjc2N2U1YzM4MjhlYWEzZmExNDljMmExMDViMzcyOWE2ODk0ZmE3
Y2YxNTQ5ZTciCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3dheWxhbmQuZnJlZWRl
c2t0b3Aub3JnL3JlbGVhc2VzLmh0bWwiCiAKLS0gCjIuMzEuMQoK

--===============8672960656936715243==--

