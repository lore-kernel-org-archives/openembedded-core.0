Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A167FC25B5C
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.834.1686887483995938221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GMAuLyWU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c2544768-55b37e5b-0ec9-4c90-bb04-aadc461d10fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TsInnaxAOE3GdfqYGZqTinc3KSPvqcJAsKUuX3wJ9cc=;
	b=GMAuLyWUqVkeFjdUMlVYnKloYyBETy200gYNkTEwZrFJqhdELxVVmRtglJhhKUcJ
	ox94gIttygERdRx/9qLYm8MdOKKN3rNOrHPz/8rZNHHs6/Sp4PqPR+UqgMwOd8E1bL8
	fXWFSPyHLwJRTshtLF1kC4iOnkk+qSv0Gy4VKoHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TsInnaxAOE3GdfqYGZqTinc3KSPvqcJAsKUuX3wJ9cc=;
	b=QxgFy3jUQkNqOg/rjOi9yJqLkXxb5n8mhjrt9fH44tLVlirjAPAvQ738Nlf5VkFx
	GAwhTAkRZNy0r2QVL6oYqh13fh82/uvYWII1I903TXxZeujcT/xawcwUr/T4pnC0HJH
	UDUIdLXUy6P90vCbHFVhDey4WfDmfDx4tWl/Ih+8=
Content-Type: multipart/mixed; boundary="===============6257504128873421888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.0.2 FAILED
Message-ID: <01010188c2544768-55b37e5b-0ec9-4c90-bb04-aadc461d10fb-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182943

--===============6257504128873421888==
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
From fc1b4164ec175d0b4c0bfd163119e8f7d1b2e0c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 14:31:46 +0000
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


--===============6257504128873421888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (895 cached, 3 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4b1bbcffd299f72a1e1aba379aa61c2a7a8c7adb"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 335 Local 159 Mirrors 0 Missed 176 Current 494 (47% match, 78% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 103 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch allarch...done.
Removing 41 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 637 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 706 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 716 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 729 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 751 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 764 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 783 of 829 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 829 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_253.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 829 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-native-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 934 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch)
NOTE: Running task 999 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 1001 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_fetch)
NOTE: Running task 1008 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1057 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 1065 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_write_config)
NOTE: Running task 1078 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1080 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1082 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1090 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe qemu-native-8.0.0-r0: task do_fetch: Started
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.0.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz_bad-checksum_bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0
NOTE: Running task 1201 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1240 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: Running task 1242 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1248 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_fetch)
NOTE: Running task 1261 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1262 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1263 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: Running task 1360 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 1361 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1367 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Started
NOTE: Running task 1397 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 1404 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_warn_musl)
NOTE: Running task 1405 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: Running task 1436 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 1448 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_unpack)
NOTE: Running task 1449 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: Running task 1526 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: Running task 1595 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1618 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 1637 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1653 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1663 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Started
NOTE: Running task 1713 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: Running task 1817 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.0.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_253.3-r0: task do_warn_musl: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: Running task 1842 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1887 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_write_config: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1982 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe systemd-1_253.3-r0: task do_fetch: Succeeded
NOTE: Running task 2036 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 2037 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe qemu-8.0.2-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running task 2174 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 2176 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe qemu-8.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_8.0.2.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2179 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: Running task 2180 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 2184 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe qemu-8.0.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 2189 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 2191 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: Running task 2193 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_253.3-r0: task do_unpack: Succeeded
NOTE: Running task 2197 of 2608 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_253.3.bb:do_patch)
NOTE: recipe systemd-1_253.3-r0: task do_patch: Started
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.0.0.tar.xz - will attempt other sources if available
NOTE: recipe systemd-1_253.3-r0: task do_patch: Succeeded
WARNING: qemu-native-8.0.0-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.0.0-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz_bad-checksum_bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0
NOTE: recipe qemu-native-8.0.0-r0: task do_fetch: Failed
NOTE: recipe qemu-8.0.2-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2198 tasks of which 2145 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.0.0-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.0.0.tar.xz
ERROR: qemu-native-8.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/qemu-8.0.0.tar.xz\' has sha256 checksum \'bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0\' when \'f060abd435fbe6794125e2c398568ffc3cfa540042596907a8b18edca34cf6a5\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.0.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/qemu-native/8.0.0-r0/temp/log.do_fetch.1756104
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_fetch) failed with exit code '1'

--===============6257504128873421888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.0.0-8.0.2.patch"

RnJvbSBmYzFiNDE2NGVjMTc1ZDBiNGMwYmZkMTYzMTE5ZThmN2QxYjJlMGM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTQ6MzE6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11OiB1cGdyYWRlIDguMC4wIC0+IDguMC4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUuaW5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXVfOC4wLjAuYmIgPT4gcWVtdV84LjAuMi5iYn0gfCAwCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXVfOC4wLjAuYmIgPT4gcWVtdV84LjAuMi5iYn0gKDEw
MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwppbmRleCA2YWNkYTYxNDI1Li4xZjVi
ODJlNzY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYwpAQCAtMzQsNyArMzQsNyBA
QCBTUkNfVVJJID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54
eiBcCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+
XGQrKFwuXGQrKSspXC50YXIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjYwZjAzNDE1MzEx
ODFkNmNjMzk2OWRkMTlhMDEzZDA0MjdhODdmOTE4MTkzOTcwZDlhZGI5MTEzMWU1NmQwIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImYwNjBhYmQ0MzVmYmU2Nzk0MTI1ZTJjMzk4NTY4ZmZjM2NmYTU0
MDA0MjU5NjkwN2E4YjE4ZWRjYTM0Y2Y2YTUiCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdl
dCA9ICIgZmlsZTovL2Nyb3NzLnBhdGNoIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2Rr
ID0gIiBmaWxlOi8vY3Jvc3MucGF0Y2giCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11XzguMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV84
LjAuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdV84LjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdV84LjAuMi5iYgotLSAKMi4zOS4yCgo=

--===============6257504128873421888==--

