Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19320C2BBF0
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.39309.1656687062423134569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lQGU5ZpG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010181ba3e6938-f4c0aea1-b518-49cf-8c70-2c338c8f793d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6hTXC750KjC2r1S70nAaLsvRbYyX2gT1v9GN1nCfVi4=;
	b=lQGU5ZpGZeQ9cRYNnjwjB4RZmCD/pAvdfkt7NONXz1IShqaDA5B3AupOYWO82epq
	b1XOCRNmfQVVSoPtbNH8/iX/WurAUAwGm6/M2T2e3UXiBSlhMGMhdvH3yJf5FKS4/xG
	SV8ilzGro2mNPIHgr+FCJVT0ZnE5IdUFRtBdR0t8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687061;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6hTXC750KjC2r1S70nAaLsvRbYyX2gT1v9GN1nCfVi4=;
	b=Ime+FAohi7JIXFrnKF9K3NoXsW1bkGrjEkWnzXn6XXTL4vOsSVrgcI4TgcC28bAy
	2mY8W4BBQuRDcHcuI7Fm1r3UIwO564umLHl9NIGBQON1JofVfLvkPOehp3xe+Y4oSNv
	Lh7LjK7upv4otz9jSZMtJidzRV7XmUDHMdruiEQE=
Content-Type: multipart/mixed; boundary="===============0799321204656849815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.72.1 SUCCEEDED
Message-ID: 
 <01010181ba3e6938-f4c0aea1-b518-49cf-8c70-2c338c8f793d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167482

--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.72.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.72.0-2.72.1.patch
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
--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 3 Mirrors 0 Missed 42 Current 390 (6% match, 90% complete)
Removing 12 stale sstate objects for arch qemuppc...done.
Removing 18 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 977 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 1027 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 1074 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_fetch)
NOTE: Running task 1088 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_write_config)
NOTE: Running task 1228 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1283 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: Running task 1285 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1286 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1287 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_unpack)
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1330 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1331 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1507 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic unihash changed to c68186bf18fcca6032d1588d84ee6284fdeee08e57a41c821e5831103d7d020a
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: Running task 1509 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 24e7bbdb90fcd4b475610092eb7faada85d7d9355d2cd4f7125251b99c42e3bd
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1514 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1515 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1516 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f21dc99d20ac7d87594cf6f890075c0c2a720b47039a37779f6a3cf7d22d0088
NOTE: Running task 1519 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1521 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to 82381b6f0a2f0ee5cdef5dc0676c0e42f08a157a0e92e085168877161888299b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Running setscene task 425 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: Running task 1522 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: Running task 1523 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot unihash changed to 58782a16334826c3f8b99757c826be785e7c73909c852383a6da99320015591c
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to 5a2ff072d7f30162bbf1a870f4d9bf5d6bd6bbab6f37ae155944f6377f0c686e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Running setscene task 424 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 425 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: Running setscene task 426 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to 00949faf2ca607e904de4d47ec56cd0c682e923133b4c374eb9a1d5d41199e03
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package unihash changed to c734977047be9e51c8ca9836bf113bcf11a8a9290e20263bc922aa4f46374e86
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata became valid
NOTE: Running setscene task 430 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1545 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 434 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to f5c5bfd5addc1f167e210e2521f8a9bb5b35ca91fa26fadf12a5d9b7997c8a04
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 431 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1555 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot unihash changed to 3227b635e2c877ff79aba2d8abdd6e92ed35a91dac8e0295316b3ecb7c81cf8c
NOTE: Setscene tasks completed
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_configure)
NOTE: recipe systemd-1_251.2-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package unihash changed to 972e8554e0ed3f45b8dc8aec335d70d218d150b1d7c463992edab9f016b836c9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe systemd-1_251.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_compile)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1570 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_install)
NOTE: recipe systemd-1_251.2-r0: task do_install: Started
NOTE: recipe systemd-1_251.2-r0: task do_install: Succeeded
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_package)
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_package: Started
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot unihash changed to b587690ad18ba451e7c07c20daaf04d16f4405d5af97961d608466a57eab4eed
NOTE: Setscene tasks completed
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Failed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1514 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glib-2.0/1_2.72.2-r0/temp/log.do_packagedata.872156
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata) failed with exit code '1'

--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 586548 to 588100 (+0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGSIZE changed from 7686 to 8152 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGSIZE changed from 7293 to 7739 (+6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 501749 to 502240 (+0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.72.0" to "2.72.1"
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.72/glib-networking-2.72.0.tar.xz;name=archive file://run-ptest" to "https://download.gnome.org/sources//glib-networking/2.72/glib-networking-2.72.1.tar.xz;name=archive file://run-ptest"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.72.0 [default] to 2.72.1 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.72.0" to "2.72.1"

--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1656 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 4 Mirrors 0 Missed 42 Current 389 (8% match, 90% complete)
Removing 12 stale sstate objects for arch qemux86_64...done.
Removing 18 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 423 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 977 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 1027 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 1074 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_fetch)
NOTE: Running task 1088 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_write_config)
NOTE: Running task 1228 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1284 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1286 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: Running task 1287 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_unpack)
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1329 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1330 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: Running task 1331 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic)
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1507 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic unihash changed to c68186bf18fcca6032d1588d84ee6284fdeee08e57a41c821e5831103d7d020a
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1509 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ceacde96a943d5e36c69eaeecad218c8f6bf77ab868ef4c4f4c40b6376bbdffe
NOTE: Running task 1511 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1515 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1516 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1517 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68885898fa42694decaaa93fb8f5351a974266272251ec3d900503cb2ba7f9b5
NOTE: Running task 1518 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: Running task 1519 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: Running task 1523 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to b58bf204c46cd2486cd0b509d86f9515b627108cafa811df06dd2a1eeecab27b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 422 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot unihash changed to 3bf9b2c52d231743555762b12f7233b9f4e202b02a2fa5d5a2c68f67c0fcc385
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to 984d36ee9261d87baea9a818cd23e6de5f322e6ec939f826155bd4af42de2b35
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Running setscene task 422 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 423 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 435 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to ed35a89ec14c8492e052db7e5ddd096b461dfc7da4e6b3d810de68ee14776198
NOTE: Setscene tasks completed
NOTE: Running task 1551 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1552 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package unihash changed to 514fa09bc6750af833f44e4346c7ba74851b261298907ecdc17b7fd81bf002b8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata became valid
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to a49cef6431193cb729b3d0ce35a33adffc74c4658946bffa2b99c5c02660cd80
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 431 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1555 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot unihash changed to c3a23a718dbedf3490f97096b6ac0599d96dee88744f22110f2f190a6c0cbb11
NOTE: Setscene tasks completed
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_configure)
NOTE: recipe systemd-1_251.2-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package unihash changed to b8854305e7c439af08e437f979a9c8c2202387e536618076f6c7fd00a293616c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe systemd-1_251.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_compile)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1570 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_install: Succeeded
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_package)
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_package: Started
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot unihash changed to 00ad81142f10b0a58da11eb5618b0a04ad0d7c1fdbdea6d7307c5b22d8d7e923
NOTE: Setscene tasks completed
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Failed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1514 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.72.2-r0/temp/log.do_packagedata.731527
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata) failed with exit code '1'

--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-32 sysroot...done.
Removing 61 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 138 Mirrors 0 Missed 17 Current 148 (89% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 153 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 161 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 162 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 163 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 164 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 165 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 167 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 178 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 180 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 182 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 647 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 669 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 670 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_fetch)
NOTE: Running task 671 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 681 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: Running task 682 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_unpack)
NOTE: Running task 683 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 185 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 684 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 188 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 200 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 208 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 697 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_patch)
NOTE: Running task 709 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 715 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 720 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 725 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 726 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 727 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 221 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 225 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: Running task 748 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 750 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic unihash changed to c68186bf18fcca6032d1588d84ee6284fdeee08e57a41c821e5831103d7d020a
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 751 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 768 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 769 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 243 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 244 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: Running task 775 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 248 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 250 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 776 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 793 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6728b82399c51746d3fb26f9f0cd45942f82befd320f14c8b0368e7fe1dc57bf
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 273 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 280 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 303 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 994 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1138 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1139 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1140 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1141 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1142 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1143 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1144 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1145 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1146 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1147 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1148 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1150 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1151 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1152 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1154 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1155 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1156 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 1157 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 1158 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1159 of 1167 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1159 tasks of which 1113 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glib-2.0/1_2.72.2-r0/temp/log.do_packagedata.909434
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata) failed with exit code '1'

--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 3 Mirrors 0 Missed 42 Current 386 (6% match, 90% complete)
Removing 12 stale sstate objects for arch qemumips...done.
Removing 18 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 977 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 1027 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 1071 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1072 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_fetch)
NOTE: Running task 1082 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1119 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_write_config)
NOTE: Running task 1218 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1273 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Succeeded
NOTE: Running task 1275 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1276 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1277 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_unpack)
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1322 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1323 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: Running task 1324 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Succeeded
NOTE: Running task 1490 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 1491 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1492 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1493 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic unihash changed to c68186bf18fcca6032d1588d84ee6284fdeee08e57a41c821e5831103d7d020a
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1495 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1496 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1497 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5a87bce771979224b08661aca9e0f2c5a3c9278fb6b3f8becbeb8c95beab0433
NOTE: Running task 1499 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1501 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: Running task 1502 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1505 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1506 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fc785bd9401961ddf48c66e20cc7d64b01053c2960c2558eeebb4f01a6ac1297
NOTE: Running task 1507 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to e096d76c8c6c07dc9d900d3f88120dd7576002a3f7a1696ede61615266d5581c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Running setscene task 422 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: Running task 1509 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot unihash changed to ff17a8755503b2782952e3b24608a64b2673cbbb7c34a95c7a72aaa27c1aa0b1
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to efdea2e79d18d60ec34b91a3c40b68a42e907480cf816bb2ff38adbba4bd8a74
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Running setscene task 418 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 419 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: Running setscene task 420 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_setscene)
NOTE: Running setscene task 422 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1527 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1531 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1532 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to 0e3ec0defdfab05155e77f460e2262a6d5b0c27c0d493a17d88ef9bdf2907e28
NOTE: Running task 1533 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package unihash changed to c5c41efcf3d22ba83c8d8457899a7e0ace5bcdbff082005a6461a1be016bd1b4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata became valid
NOTE: Running setscene task 423 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1534 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 430 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to f584689359d1f059f7d72680d65183a69c21a16b58651935658e6050d949b5e9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 425 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1544 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot unihash changed to 823883b5c87a29503d7aaea1da5fd69b3a9fbf493f797b645ce03bfecb266a8b
NOTE: Setscene tasks completed
NOTE: Running task 1545 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1546 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_configure)
NOTE: recipe systemd-1_251.2-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package unihash changed to 1b03b89f7f594e6025d1a6a8c15e6d4af45d8a969dc76b13f61f32c1d0cb4ce3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 427 of 431 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1549 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe systemd-1_251.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1550 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_compile)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1552 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1554 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1555 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1556 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1559 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1561 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1562 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1563 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_install)
NOTE: recipe systemd-1_251.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_package)
NOTE: Running task 1566 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_package: Started
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot unihash changed to 0bcd5ec26d79aefdd68b255f3f8ddd3b384cbef3cd5956660db40497d1c0517a
NOTE: Setscene tasks completed
NOTE: Running task 1567 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1568 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1569 of 1580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Failed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1569 tasks of which 1500 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glib-2.0/1_2.72.2-r0/temp/log.do_packagedata.825718
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata) failed with exit code '1'

--===============0799321204656849815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.72.0-2.72.1.patch"

From 9b652d01ba9e98a2084079994115d21918d08577 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 06:48:10 +0000
Subject: [PATCH] glib-networking: upgrade 2.72.0 -> 2.72.1

---
 .../{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.72.0.bb => glib-networking_2.72.1.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
index d578f17aa5..41f18d1c48 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
+SRC_URI[archive.sha256sum] = "6fc1bedc8062484dc8a0204965995ef2367c3db5c934058ff1607e5a24d95a74"
 
 PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
-- 
2.31.1


--===============0799321204656849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9206a0066735ec9b7e459ce6a2dd3ee82ff927f2"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 3 Mirrors 0 Missed 42 Current 390 (6% match, 90% complete)
Removing 12 stale sstate objects for arch qemuarm...done.
Removing 18 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 977 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_fetch)
NOTE: Running task 1027 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_write_config)
NOTE: Running task 1074 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_fetch)
NOTE: Running task 1088 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_write_config)
NOTE: Running task 1231 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1284 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_fetch: Succeeded
NOTE: Running task 1286 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_write_config: Succeeded
NOTE: Running task 1287 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1288 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_unpack)
NOTE: recipe glib-networking-2.72.1-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1331 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure)
NOTE: Running task 1332 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_configure)
NOTE: Running task 1333 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_unpack: Succeeded
NOTE: Running task 1504 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_patch: Succeeded
NOTE: Running task 1505 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1507 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_patch)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_lic unihash changed to c68186bf18fcca6032d1588d84ee6284fdeee08e57a41c821e5831103d7d020a
NOTE: recipe glib-networking-2.72.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1509 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1512 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 687ea4f02cf2520d1e4f6f05acf6a7c02d4c00ce54cbb04ee3ff9a790a9b0d36
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe xorgproto-2022.1-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_install)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1515 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1516 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b884e10bab8744614c446ec2af7b2429353d31ec97ee2b6763a153ee41e4951
NOTE: Running task 1517 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1518 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xorgproto-2022.1-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot)
NOTE: Running task 1520 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1521 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: Running task 1522 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1523 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe xorgproto-2022.1-r0: task do_package: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot unihash changed to 666316a6adee857d43e3f61cf5cefc65989b8c5d61ee9721e1000428c4db0651
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Running setscene task 423 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot unihash changed to 95104d6a375d879bc431e0491974621b060a433db7487b29a1f6e3f50943c6b8
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_compile_ptest_base)
NOTE: recipe xorgproto-2022.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_package unihash changed to 4aa991ef3194173d685f1ce224d71df489eab25d7ba968421804dd6ebc03b4d1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Running setscene task 424 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: Running setscene task 426 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.20.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot)
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package)
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.20.0-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot unihash changed to 513cc7839f9f82d6831c975586377d1353caaab931250e7a1824a346897a86f6
NOTE: Running task 1549 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package unihash changed to cf5886ae26c30e450067990223e1bac9a6740a600e3bba690116242d0081aebf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata became valid
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1550 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.20.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_package unihash changed to cc9940e8872ffb73ad6529ebcd2950fbc6079f0080e6eba66b52161efa22eb56
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata became valid
NOTE: Running setscene task 431 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1555 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1557 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot unihash changed to 5cb8971799bfd7cc8f90e38022ea725af04f4bb94838616355c0dbfb7138e75b
NOTE: Setscene tasks completed
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_configure)
NOTE: recipe systemd-1_251.2-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package unihash changed to 2d3343d1dfda47f48d0bdcdaba65b21e3b681696bf4706336849c01d900f86bb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata became valid
NOTE: Running setscene task 432 of 435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_compile_ptest_base)
NOTE: recipe systemd-1_251.2-r0: task do_configure: Succeeded
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_populate_sysroot)
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_package)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1570 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_configure_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile: Succeeded
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_compile_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_install_ptest_base)
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-networking/glib-networking_2.72.1.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_compile: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_install)
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_install: Started
NOTE: recipe glib-networking-2.72.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_install: Succeeded
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_package)
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot)
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_251.2-r0: task do_package: Started
NOTE: recipe systemd-1_251.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_251.2.bb:do_populate_sysroot unihash changed to f196677c0384ad9e1f5f9f4648d939d9a3fd041d4a30cfe0b0bb162c88065cba
NOTE: Setscene tasks completed
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.2-r0: task do_packagedata: Failed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_251.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1514 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 109 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.72.3-r0 to 1:2.72.2-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.72.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glib-2.0/1_2.72.2-r0/temp/log.do_packagedata.778468
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb:do_packagedata) failed with exit code '1'

--===============0799321204656849815==--

