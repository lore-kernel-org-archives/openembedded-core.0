Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ECEC25B74
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10766.1688227323356980220
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J/fDHs12;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018912309a98-617087c9-92e0-4fbb-a4dd-423e59e4ae3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GktL+sR1PXOa0qe7JBg3LZ5ePfp3z7Xe3mchNlcaSfE=;
	b=J/fDHs12rA5NVW1jXI2bh6mh2/dOqT6VrqaBxtwULFCm3icdT3D4XG3Afe3LiJ8F
	QHBQIiuN3qrp8Bym2JvUl22Jt8roTEfPvNTHuEDTzD90Go246GXwhemLlNMxAqotMu0
	NyiMLEHAfjoQKYo55tzRGLLM53HxWNFNMEvAlqm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GktL+sR1PXOa0qe7JBg3LZ5ePfp3z7Xe3mchNlcaSfE=;
	b=kAuFf3NauficU/TN/4r0HjCB3mRQGADW0BJb9orT5quQqqSwRPboAq9ENp9eYiyX
	uxxKp7f7RnW5kv6QFnbiXlOz36y44L+QcJTlh6qtghUS2mbwfB7LJL6YyvO8xpf4JMg
	4k3og04APhr51GmrA23Hpzx37mxBlg+GvpQbz/Nc=
Content-Type: multipart/mixed; boundary="===============1619943706394074597=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.0.2 FAILED
Message-ID: <0101018912309a98-617087c9-92e0-4fbb-a4dd-423e59e4ae3e-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183729

--===============1619943706394074597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *8.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-qemu-upgrade-8.0.0-8.0.2.patch
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

-- >8 --
From a7cd5a906598367712604137a04039a4446d4efc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 09:38:00 +0000
Subject: [PATCH] qemu: upgrade 8.0.0 -> 8.0.2

---
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 meta/recipes-devtools/qemu/{qemu_8.0.0.bb => qemu_8.0.2.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu_8.0.0.bb => qemu_8.0.2.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6acda61425..1f5b82e764 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,7 +34,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0"
+SRC_URI[sha256sum] = "f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.0.2.bb
-- 
2.39.2


--===============1619943706394074597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (893 cached, 3 parsed). 1798 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:76c3c871437313e695cc8293f23258c95558fd8f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 370 Local 194 Mirrors 0 Missed 176 Current 459 (52% match, 78% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 82 stale sstate objects for arch core2-32...done.
Removing 41 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 539 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 540 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 552 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 573 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 599 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 620 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 672 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 674 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 683 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 715 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 728 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 750 of 829 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 829 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.66-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 780 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Running task 822 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch)
NOTE: Running task 887 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 889 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 896 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 945 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 948 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 961 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 964 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 965 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 973 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe qemu-native-8.0.0-r0: task do_fetch: Started
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.0.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz_bad-checksum_bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1178 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1186 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1190 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 1199 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1221 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_fetch)
NOTE: Running task 1223 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1229 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: Running task 1242 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1243 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1244 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: Running task 1341 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_write_config)
NOTE: Running task 1347 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: Running task 1383 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1384 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: Running task 1432 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1436 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_fetch)
NOTE: Running task 1439 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1440 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_fetch)
NOTE: Running task 1448 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1452 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: Running task 1467 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_fetch)
NOTE: Running task 1478 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1485 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: Running task 1510 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: Running task 1512 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_write_config)
NOTE: Running task 1529 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1530 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_fetch)
NOTE: Running task 1553 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1554 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1555 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1556 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1565 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_fetch)
NOTE: Running task 1596 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: Running task 1646 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 1695 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_write_config)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1703 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_unpack)
NOTE: recipe libical-3.0.16-r0: task do_fetch: Started
NOTE: Running task 1719 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libical-3.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1743 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running task 1744 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: Running task 1745 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_unpack)
NOTE: recipe bluez5-5.66-r0: task do_fetch: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1752 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: Running task 1759 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Started
NOTE: recipe vala-0.56.8-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 1774 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_unpack)
NOTE: Running task 1775 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: Running task 1781 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.0.2.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_fetch: Succeeded
NOTE: Running task 1791 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 1801 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_unpack)
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: Running task 1802 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_fetch: Started
NOTE: Running task 1815 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1816 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1819 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1849 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Started
NOTE: Running task 1862 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1863 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1884 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libdrm-2.4.115-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1888 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 1891 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1902 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: Running task 1981 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe mesa-2_23.1.3-r0: task do_write_config: Succeeded
NOTE: Running task 1994 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe qemu-8.0.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe bluez5-5.66-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2050 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe qemu-8.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2139 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 2149 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.0.2.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 2150 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_patch)
NOTE: recipe mesa-2_23.1.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 2152 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: Running task 2153 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_patch)
NOTE: Running task 2154 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2156 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2157 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 2158 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 2159 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 2161 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 2162 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe qemu-8.0.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Started
NOTE: Running task 2163 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: Running task 2165 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.115-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2168 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 2177 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_generate_toolchain_file)
NOTE: Running task 2179 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_unpack: Succeeded
NOTE: Running task 2182 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.66.bb:do_patch)
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: Running task 2183 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.66-r0: task do_patch: Started
NOTE: Running task 2187 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: recipe libical-3.0.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_unpack: Succeeded
NOTE: Running task 2188 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 2191 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe bluez5-5.66-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2195 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_patch)
NOTE: recipe mesa-2_23.1.3-r0: task do_patch: Started
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_patch: Succeeded
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.0.0.tar.xz - will attempt other sources if available
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.0.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz_bad-checksum_bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0
NOTE: recipe qemu-native-8.0.0-r0: task do_fetch: Failed
NOTE: recipe qemu-8.0.2-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2198 tasks of which 2095 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.0.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.0.0.tar.xz
ERROR: qemu-native-8.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz\' has sha256 checksum \'bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0\' when \'f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.0.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/qemu-native/8.0.0-r0/temp/log.do_fetch.2430947
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch) failed with exit code '1'

--===============1619943706394074597==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.0.0-8.0.2.patch"

RnJvbSBhN2NkNWE5MDY1OTgzNjc3MTI2MDQxMzdhMDQwMzlhNDQ0NmQ0ZWZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAwOTozODowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IHVwZ3JhZGUgOC4wLjAgLT4gOC4wLjIKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS97cWVtdV84LjAuMC5iYiA9PiBxZW11XzguMC4yLmJifSB8IDAKIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV84LjAuMC5iYiA9PiBxZW11XzguMC4yLmJifSAoMTAw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IDZhY2RhNjE0MjUuLjFmNWI4
MmU3NjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC0zNCw3ICszNCw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6
IFwKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5c
ZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImJiNjBmMDM0MTUzMTE4
MWQ2Y2MzOTY5ZGQxOWEwMTNkMDQyN2E4N2Y5MTgxOTM5NzBkOWFkYjkxMTMxZTU2ZDAiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjA2MGFiZDQzNWZiZTY3OTQxMjVlMmMzOTg1NjhmZmMzY2ZhNTQw
MDQyNTk2OTA3YThiMThlZGNhMzRjZjZhNSIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0
ID0gIiBmaWxlOi8vY3Jvc3MucGF0Y2giCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsg
PSAiIGZpbGU6Ly9jcm9zcy5wYXRjaCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXVfOC4wLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11Xzgu
MC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11XzguMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11XzguMC4yLmJiCi0tIAoyLjM5LjIKCg==

--===============1619943706394074597==--

