Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF586ECAA41
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.7523.1685693431199444746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PJST9y4i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101887b2879ec-ca6a9b0a-069f-46b3-b2cd-7c47c0f657ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zhYVqhXWYRCpY1r7oItbsco12iiuPyNmsf+/QIfMXKI=;
	b=PJST9y4ilqz184Wg1ELcwfS2ZnMGZDT5Ks6aaAo8dZcRFE8UFtIZGf44T8x/oTW4
	PNTtWBHzcCTB/jrhytzxSTbRAINKQ75jzsbw5fkSOPVq/gVJOlCP2LkY2eYdpyCkEfM
	PObo0LhWjnT6369ysRJnY0jhhnprR9n2e25PRuFU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693430;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zhYVqhXWYRCpY1r7oItbsco12iiuPyNmsf+/QIfMXKI=;
	b=EjmqpeIsjkm8eXgpVeqknhNe9bz5C0rTxlyVh6O3bCW0+4GYW/BJtnevLlyxpiS7
	9k4W++snBYP0bn241dVbMcwMLtRTNOUiK1Vl0ZFAe1PhlyeLcf46+ppQm5WpepgN6x+
	2X/2/RjVwW/cFF+S/eHJDEMgdaJnL3B7RXRsr/z8=
Content-Type: multipart/mixed; boundary="===============2864377882850190154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.76.3 FAILED
Message-ID: <010101887b2879ec-ca6a9b0a-069f-46b3-b2cd-7c47c0f657ab-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182156

--===============2864377882850190154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.76.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.76.2-2.76.3.patch
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
--===============2864377882850190154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f09666f126d50ebf42e8404f20989301adbb4c95"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 186 Local 127 Mirrors 0 Missed 59 Current 320 (68% match, 88% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 16 stale sstate objects for arch qemux86...done.
Removing 16 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 417 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 422 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 464 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 468 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 479 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 980 of 1832 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1022 of 1832 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1034 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1035 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1038 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 1081 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1082 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1083 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 1096 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1098 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1099 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 1131 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: Running task 1152 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1160 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: Running task 1182 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1194 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1195 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1229 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: Running task 1282 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1297 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1334 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1335 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1460 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: Running task 1471 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1498 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: Running task 1528 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 1581 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1627 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1645 of 1832 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1646 of 1832 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1647 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1648 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1649 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 1650 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1657 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: Running task 1658 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1659 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1661 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Running task 1662 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: Running task 1664 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 1665 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1666 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 1667 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 1669 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1674 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 1681 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 1682 of 1832 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: Running task 1683 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1684 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_lic)
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 1685 of 1832 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.3-r0: task do_patch: Failed
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 1685 tasks of which 1632 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glib-2.0-native-1_2.76.3-r0 do_patch: Applying patch 'relocate-modules.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/glib-2.76.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.76.3-r0/temp/log.do_patch.1287376
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch) failed with exit code '1'

--===============2864377882850190154==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.76.2-2.76.3.patch"

RnJvbSA3MzcyYzU1MzkzMGZlZDdhYTlmZGUyZjM4NmIzMTFiMGI1ODJmNmVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwNzo0NDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzYuMiAtPiAyLjc2LjMKCi0tLQogLi4udXRleF9zaW1wbGUtaW5h
ZHZlcnRlbnRseS1tb2RpZnktZXJyLnBhdGNoIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggIHwgIDYgKystLQogLi4u
e2dsaWItMi4wXzIuNzYuMi5iYiA9PiBnbGliLTIuMF8yLjc2LjMuYmJ9IHwgIDQgKy0tCiAzIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvMDAwMS1Bdm9pZC1o
YXZpbmctZ19mdXRleF9zaW1wbGUtaW5hZHZlcnRlbnRseS1tb2RpZnktZXJyLnBhdGNoCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuNzYuMi5iYiA9PiBnbGli
LTIuMF8yLjc2LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvMDAwMS1Bdm9pZC1oYXZpbmctZ19mdXRleF9zaW1wbGUtaW5hZHZlcnRl
bnRseS1tb2RpZnktZXJyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0y
LjAvMDAwMS1Bdm9pZC1oYXZpbmctZ19mdXRleF9zaW1wbGUtaW5hZHZlcnRlbnRseS1tb2RpZnkt
ZXJyLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBkYjYzY2ZkOTFlLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wLzAwMDEtQXZv
aWQtaGF2aW5nLWdfZnV0ZXhfc2ltcGxlLWluYWR2ZXJ0ZW50bHktbW9kaWZ5LWVyci5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDM2ICswLDAgQEAKLUZyb20gZWRkMWU0N2YxMDc0MTBkOWU0ZWRi
NjkxMzM1NDEwMDI2YWU1YTUzNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFBldGVy
IEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPgotRGF0ZTogVHVlLCAy
NSBBcHIgMjAyMyAyMDowMjozMSArMDIwMAotU3ViamVjdDogW1BBVENIXSBBdm9pZCBoYXZpbmcg
Z19mdXRleF9zaW1wbGUoKSBpbmFkdmVydGVudGx5IG1vZGlmeSBlcnJubwotCi1JZiBib3RoIF9f
TlJfZnV0ZXggYW5kIF9fTlJfZnV0ZXhfdGltZTY0IGFyZSBkZWZpbmVkLCBnX2Z1dGV4X3NpbXBs
ZSgpCi13aWxsIGZpcnN0IGNhbGwgZnV0ZXhfdGltZTY0KCkuIElmIHRoYXQgZmFpbHMgd2l0aCBF
Tk9TWVMsIHRoZW4KLWZ1dGV4X3RpbWUoKSBpcyBjYWxsZWQgaW5zdGVhZC4gSG93ZXZlciwgZXJy
bm8gd2FzIG5vdCBzYXZlZCBhbmQKLXJlc3RvcmVkIGluIHRoaXMgY2FzZSwgd2hpY2ggd291bGQg
cmVzdWx0IGluIGdfZnV0ZXhfc2ltcGxlKCkKLXJldHVybmluZyB3aXRoIGVycm5vIHNldCB0byBF
Tk9TWVMsIGV2ZW4gaWYgZnV0ZXhfdGltZSgpIHN1Y2NlZWRlZC4KLQotVXBzdHJlYW0tU3RhdHVz
OiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWIvLS9jb21taXQv
ZWRkMWU0N2YxMDc0MTBkOWU0ZWRiNjkxMzM1NDEwMDI2YWU1YTUzNF0KLVNpZ25lZC1vZmYtYnk6
IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPgotLS0tCi0g
Z2xpYi9ndGhyZWFkcHJpdmF0ZS5oIHwgNiArKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9nbGliL2d0aHJlYWRwcml2
YXRlLmggYi9nbGliL2d0aHJlYWRwcml2YXRlLmgKLWluZGV4IDljODQ3ZTAzOS4uNzRkMzdiYTMy
IDEwMDY0NAotLS0tIGEvZ2xpYi9ndGhyZWFkcHJpdmF0ZS5oCi0rKysgYi9nbGliL2d0aHJlYWRw
cml2YXRlLmgKLUBAIC02NSw5ICs2NSwxMyBAQCBzdHJ1Y3QgIF9HUmVhbFRocmVhZAotICNkZWZp
bmUgZ19mdXRleF9zaW1wbGUodWFkZHIsIGZ1dGV4X29wLCAuLi4pICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKLSAgIEdfU1RNVF9TVEFSVCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAotKyAgICBpbnQgc2F2ZWRfZXJybm8gPSBlcnJubzsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgaW50
IHJlcyA9IHN5c2NhbGwgKF9fTlJfZnV0ZXhfdGltZTY0LCB1YWRkciwgKGdzaXplKSBmdXRleF9v
cCwgX19WQV9BUkdTX18pOyBcCi0gICAgIGlmIChyZXMgPCAwICYmIGVycm5vID09IEVOT1NZUykg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotLSAgICAgIHN5
c2NhbGwgKF9fTlJfZnV0ZXgsIHVhZGRyLCAoZ3NpemUpIGZ1dGV4X29wLCBfX1ZBX0FSR1NfXyk7
ICAgICAgICAgICAgICAgIFwKLSsgICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0rICAgICAgICBl
cnJubyA9IHNhdmVkX2Vycm5vOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAotKyAgICAgICAgc3lzY2FsbCAoX19OUl9mdXRleCwgdWFkZHIsIChn
c2l6ZSkgZnV0ZXhfb3AsIF9fVkFfQVJHU19fKTsgICAgICAgICAgICAgIFwKLSsgICAgICB9ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCi0gICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgR19TVE1UX0VO
RAotICNlbGlmIGRlZmluZWQoX19OUl9mdXRleF90aW1lNjQpCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApp
bmRleCAzZGJhNTk5ZmMwLi4zOTljM2RkYmQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDM4ZTQwMTk2OWEyZmY4MjY5OTE5Y2JlYWNlYzczM2E2N2YwNDE3MzUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI5ZTFkZGU1ZmE2MGVhMjVmYWZiYTlmZTk4
ZTU0N2FkNTgwODAwOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRv
biA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1
NSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1
bGUgZGlyZWN0b3J5IGZvciBuYXRpdmUgYnVpbGRzCkBAIC0xMyw2ICsxMyw3IEBAIFNpZ25lZC1v
ZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAKIFBvcnQgcGF0Y2gg
dG8gMi40OAogU2lnbmVkLW9mZi1ieTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGlu
dGVsLmNvbT4KKwogLS0tCiAgZ2lvL2dpb21vZHVsZS5jIHwgNSAtLS0tLQogIDEgZmlsZSBjaGFu
Z2VkLCA1IGRlbGV0aW9ucygtKQpAQCAtNDAsNiArNDEsMyBAQCBpbmRleCAxMWNlN2Q4Li5jYzI3
ZWNkIDEwMDY0NAogICNlbmRpZgogICAgICB9CiAgCi0tLSAKLTIuMzAuMgotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5
MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjMu
YmIKaW5kZXggNmE5YTVmMzU5Yy4uMzQ5ZGQxNGRlYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wXzIuNzYuMy5iYgpAQCAtMTQsMTIgKzE0LDEyIEBAIFNSQ19VUkkg
PSAiJHtHTk9NRV9NSVJST1J9L2dsaWIvJHtTSFJUX1ZFUn0vZ2xpYi0ke1BWfS50YXIueHogXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3Qtd3JpdGUtYmluZGlyLWludG8tcGtnLWNvbmZp
Zy1maWxlcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lc29uLVJ1bi1hdG9taWNz
LXRlc3Qtb24tY2xhbmctYXMtd2VsbC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdp
by10ZXN0cy1yZXNvdXJjZXMuYy1jb21tZW50LW91dC1hLWJ1aWxkLWhvc3Qtb25seS0ucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1Bdm9pZC1oYXZpbmctZ19mdXRleF9zaW1wbGUtaW5h
ZHZlcnRlbnRseS1tb2RpZnktZXJyLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZ2lv
LXRlc3RzLXBvcnRhbC1zdXBwb3J0LUZpeC1zbmFwLXRlc3Qtb3JkZXJpbmctcmFjZS5wYXRjaCBc
CisgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIFwKICAgICAgICAgICAg
IgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcmVsb2NhdGUtbW9kdWxl
cy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI0ZjM4NDc4NTdiMWQ4Njc0Y2RiMDM4
OWEzNmVkZWMwZjEzYzY2NmNkM2NlNzI3ZWNkMzQwZWI5ZGE4YWNhOWUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYzBiZTQ0NGU0MDNkN2MzMTg0ZDFmMzk0Zjg5ZjBiNjQ0NzEwYjVlOTMzMWI1NGZh
NGU4YjUwMzc4MTNhZDMyYSIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxF
U1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBz
aXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoyLjM5LjIKCg==

--===============2864377882850190154==--

