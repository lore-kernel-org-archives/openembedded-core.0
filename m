Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916BBC7EE31
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.30352.1675272853925881843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PHlhJaPh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b15ed-02619b92-60e8-49a3-83f4-a11d0530922c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Sp9BV+p3yTG1IvgykaxW2RVQ0yfZGt74Nmkiet5sTsQ=;
	b=PHlhJaPhqP/RxKspcYfgiH8K9S/sGVtCcIPO0bm/Lc2T65VH0X0jlpsIbOaHZBPb
	yq60b3NFjbmvI6JZCKZyDJ6HIiTbzdGoxXfPFx7sKIK9hkRJGdaLR+FBUqjeXcJqhZp
	pdGFuE6dPsG6lLAbA/tjYStZ2WUcyQVdH5jP74Co=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Sp9BV+p3yTG1IvgykaxW2RVQ0yfZGt74Nmkiet5sTsQ=;
	b=Nc853Ipw6D0E7c5fFcbKu4e4+YlKVtyIRk4H4hqkjitW+Ig6E4yS5SfVjND5XBPu
	P6SDRE2X+olUX82QXqbBMaYQgv87R1NsTPv6ZTSi5AVs9dL6sXVsXCQj+N5cgseYWCe
	b6ZrGov5Qb8iXNCT3AUkcq6OjRPjGp+S96kMHZ38=
Content-Type: multipart/mixed; boundary="===============0936493491590252294=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.74.5 FAILED
Message-ID: <010101860e0b15ed-02619b92-60e8-49a3-83f4-a11d0530922c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176575

--===============0936493491590252294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.74.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.74.4-2.74.5.patch
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
--===============0936493491590252294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e7fdb927d527e3bd561f77a8ffcf9604f6f3c73"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 156 Local 97 Mirrors 0 Missed 59 Current 350 (62% match, 88% complete)
Removing 2 stale sstate objects for arch allarch...done.
Removing 16 stale sstate objects for arch qemux86...done.
Removing 16 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 423 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 428 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 467 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 473 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 506 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_252.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_252.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 948 of 1828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 1001 of 1828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1017 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 1018 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 1021 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 1075 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 1076 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 1077 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 1088 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1089 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1093 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 1118 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_fetch)
NOTE: Running task 1143 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1157 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_fetch)
NOTE: Running task 1179 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1191 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_fetch)
NOTE: Running task 1192 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1216 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_fetch)
NOTE: Running task 1288 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_write_config)
NOTE: Running task 1304 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1338 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_warn_musl)
NOTE: Running task 1339 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: Running task 1445 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: Running task 1479 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1480 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1496 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_write_config: Started
NOTE: Running task 1508 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1548 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1554 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1572 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Started
NOTE: Running task 1573 of 1828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1574 of 1828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1575 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_unpack)
NOTE: recipe systemd-1_252.4-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: Running task 1627 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe systemd-1_252.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_252.4-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe systemd-1_252.4-r0: task do_warn_musl: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_252.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1654 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_unpack)
NOTE: recipe libx11-1_1.8.3-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe systemd-1_252.4-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1655 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1656 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 1657 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 1659 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe systemd-1_252.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1670 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_patch: Started
NOTE: recipe dbus-1.14.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1677 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1678 of 1828 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe systemd-1_252.4-r0: task do_unpack: Succeeded
NOTE: Running task 1679 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.4.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_patch: Started
NOTE: recipe systemd-1_252.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1680 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1681 of 1828 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_lic)
NOTE: recipe systemd-1_252.4-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-native-1_2.74.5-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1682 tasks of which 1629 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: glib-2.0-native-1_2.74.5-r0 do_patch: Applying patch 'relocate-modules.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/glib-2.74.5'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/temp/log.do_patch.3595336
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch) failed with exit code '1'

--===============0936493491590252294==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.74.4-2.74.5.patch"

RnJvbSAxYjQyNjBkNjZkMjAwOWVjZjU4ZTA1NzRkZDM4ZGNmMDljYTA5ODc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwNzowMDoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzQuNCAtPiAyLjc0LjUKCi0tLQogLi4uL2dsaWItMi4wL2dsaWIt
Mi4wL2ZpeC1lcnJuby5wYXRjaCAgICAgICAgIHwgMzEgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggIHwgIDIgKy0KIC4uLntn
bGliLTIuMF8yLjc0LjQuYmIgPT4gZ2xpYi0yLjBfMi43NC41LmJifSB8ICA0ICstLQogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL2ZpeC1lcnJuby5wYXRj
aAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjc0LjQuYmIg
PT4gZ2xpYi0yLjBfMi43NC41LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWItMi4wL2ZpeC1lcnJuby5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wL2ZpeC1lcnJuby5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMTQ0ZmU4YmJkOC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLTIuMC9maXgtZXJybm8ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMSAr
MCwwIEBACi1Gcm9tIDY2MjY3NjVhNzlmMTI1Y2YwZWM5Y2RhZWZhNTFjZWVmNzE4ZDQxZTcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNaWNoYWVsIENhdGFuemFybyA8bWNhdGFuemFy
b0ByZWRoYXQuY29tPgotRGF0ZTogVHVlLCAyMCBEZWMgMjAyMiAxNzoxMDo0MSAtMDYwMAotU3Vi
amVjdDogW1BBVENIXSBndGhyZWFkLXBvc2l4OiBuZWVkIHRvICNpbmNsdWRlIDxlcnJuby5oPgot
Ci1hNzljNmFmMjNlZmY1ZWU5NzhkYjYyZTA0ODgyOGM5YTk5MmExMjYxIHVzZXMgZXJybm8gd2l0
aG91dCB0aGUgcmVxdWlyZWQKLWhlYWRlci4KLQotCi0oY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1p
dCAwM2NiNDI2MWUwMGNmNTA1NzkwZjRmZDRlNjlmOTdiMmVmNGZjY2NkKQotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ2xpYi8tL2Nv
bW1pdC82NjI2NzY1YTc5ZjEyNWNmMGVjOWNkYWVmYTUxY2VlZjcxOGQ0MWU3XQotU2lnbmVkLW9m
Zi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIGdsaWIv
Z3RocmVhZHByaXZhdGUuaCB8IDEgKwotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQot
Ci1kaWZmIC0tZ2l0IGEvZ2xpYi9ndGhyZWFkcHJpdmF0ZS5oIGIvZ2xpYi9ndGhyZWFkcHJpdmF0
ZS5oCi1pbmRleCA2ZWFmNDIyNzUzLi5mMzQzNjhhN2MyIDEwMDY0NAotLS0tIGEvZ2xpYi9ndGhy
ZWFkcHJpdmF0ZS5oCi0rKysgYi9nbGliL2d0aHJlYWRwcml2YXRlLmgKLUBAIC00MSw2ICs0MSw3
IEBAIHN0cnVjdCAgX0dSZWFsVGhyZWFkCi0gLyogc3lzdGVtIHRocmVhZCBpbXBsZW1lbnRhdGlv
biAoZ3RocmVhZC1wb3NpeC5jLCBndGhyZWFkLXdpbjMyLmMpICovCi0gCi0gI2lmIGRlZmluZWQo
SEFWRV9GVVRFWCkgfHwgZGVmaW5lZChIQVZFX0ZVVEVYX1RJTUU2NCkKLSsjaW5jbHVkZSA8ZXJy
bm8uaD4KLSAjaW5jbHVkZSA8bGludXgvZnV0ZXguaD4KLSAjaW5jbHVkZSA8c3lzL3N5c2NhbGwu
aD4KLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0tLSAKLUdpdExhYgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gK
aW5kZXggMTY4ZGM3MzI5MC4uYWU2ODgxYjYxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSAyYWRmZDQ1ODUwN2M4YzgzMjk1NWQ2ZmZiOTQwOGQ2YzU3NGI5NGY2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhM2NkZjE3NjQzYmYzM2Q1MzJlYzI2OTkx
Mzk3NDE5NWUxMzZiN2ZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6
NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9k
dWxlIGRpcmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43NC40LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi43NC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzQuNC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43NC41LmJiCmluZGV4IGU1Mjc5
ZTk0NmMuLjVmNzQ2M2E0YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuNzQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGli
LTIuMF8yLjc0LjUuYmIKQEAgLTE4LDExICsxOCwxMSBAQCBTUkNfVVJJID0gIiR7R05PTUVfTUlS
Uk9SfS9nbGliLyR7U0hSVF9WRVJ9L2dsaWItJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtZ2lvLXRlc3RzLW1lc29uLmJ1aWxkLWRvLW5vdC11c2UtY2FuX3J1bl9ob3N0X2Jp
bmFyaS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9jcHAtbnVsbC5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly9jcHAtbnVsbDIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vZml4LWVycm5v
LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggXAogICAg
ICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0
ZS1tb2R1bGVzLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGU4MmRhNWVhMTI5YjQ0
NDQyMjdjN2U0YTllNTk4ZjcyODhkMTk5NGJmNjNmMTI5YzQ0YjkwY2ZkMjQzMjE3MiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjZWJhODNhNTk5OWNlYjMxYTRjNGZjOTkyMTIwN2NiOWZmZmZkMmFi
MWQ2ZWMwM2MxNjJkM2Y2MDhhNWMxNGM4IgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVz
IGluIEZJTEVTUEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQg
KHVzaW5nIHNpdGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuMzcu
MwoK

--===============0936493491590252294==--

