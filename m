Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F79C25B70
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.22184.1701436491052799886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NrEk5wKt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZSxfSf+y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018c25848797-3453ef18-0770-4cf6-b627-79fb44216649-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=011orPuDEp1onkzrZo5e6jgp+nULdvBGTrMy8XN2V5A=;
	b=NrEk5wKtcx+TrNNzh/uv1kE59QK0cuN/+nhG9DIBI01Vc7R+qKuyQ8JHckc5DtaC
	XZ1nDMYXZtxTcicyDGqXOhl1OkMBrjsUxhfyTXNdvotm0iZyzS4Kv/o2Kago8MvtSzF
	3jsMu5kW+sjeNdMdxP+FF5M8E8dSszgCzMCkHQ9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=011orPuDEp1onkzrZo5e6jgp+nULdvBGTrMy8XN2V5A=;
	b=ZSxfSf+yDoHv+d/76HQe3ZA55sOLMEDGgZWiV5KbwQeuuVS5YidRmsIWdjh7lDJJ
	qB7VncYQm09EQag5Qycg7dVJEQaQG5InJTsEbmu4nRSfKxi5tKIzwZeHKy2Mf1DDxwp
	pkBrHlsFFmPLzK+cB+cJeiDYq+cHqcqb6qdPAkRw=
Content-Type: multipart/mixed; boundary="===============5520936026048431277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 8.1.3 FAILED
Message-ID: <0101018c25848797-3453ef18-0770-4cf6-b627-79fb44216649-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191611

--===============5520936026048431277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *8.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-qemu-upgrade-8.1.2-8.1.3.patch
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
From 4117d27959108c56d54d45a56d328f97f35c3c8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 09:35:18 +0000
Subject: [PATCH] qemu: upgrade 8.1.2 -> 8.1.3

---
 meta/recipes-devtools/qemu/qemu.inc                         | 2 +-
 meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/qemu/{qemu_8.1.2.bb => qemu_8.1.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5ab2cb83b4..d6a3cf47b9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,7 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 
-SRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"
+SRC_URI[sha256sum] = "43cc176804105586f74f90398f34e9f85787dff400d3b640d81f7779fbe265bb"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.1.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.1.2.bb
rename to meta/recipes-devtools/qemu/qemu_8.1.3.bb
-- 
2.39.2


--===============5520936026048431277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1847 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (909 cached, 3 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-002fb1c0c14cf790171fca93ebe557289e9d4927"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:002fb1c0c14cf790171fca93ebe557289e9d4927"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 480 Local 300 Mirrors 0 Missed 180 Current 584 (62% match, 83% complete)
Removing 74 stale sstate objects for arch core2-64...done.
Removing 3 stale sstate objects for arch x86_64...done.
Removing 41 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 648 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 692 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 715 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 730 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 764 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 766 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: recipe libslirp-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 767 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 779 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 783 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 784 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20230416-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 837 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 838 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 841 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.60.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 844 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 855 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 857 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 858 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 862 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.60-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.60-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 872 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 879 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 881 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 884 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 886 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.70-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 892 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 893 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 900 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 917 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 921 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 923 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 924 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_254.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 935 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 938 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 942 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 943 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 944 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 948 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 996 of 1064 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 999 of 1064 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1011 of 1064 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1012 of 1064 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1032 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-native-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1047 of 1064 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-native-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-native-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1064 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-native-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1086 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_recipe_qa)
NOTE: Running task 1156 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1160 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_fetch)
NOTE: Running task 1164 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: Running task 1209 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running task 1216 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_write_config)
NOTE: Running task 1234 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 1265 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1266 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1270 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_fetch)
NOTE: recipe qemu-native-8.1.2-r0: task do_recipe_qa: Started
NOTE: Running task 1360 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_fetch)
NOTE: Running task 1362 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_fetch)
NOTE: Running task 1371 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_fetch)
NOTE: Running task 1375 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_fetch)
NOTE: Running task 1388 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: Running task 1394 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: Running task 1395 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe libxcb-1.16-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1397 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe qemu-native-8.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_recipe_qa unihash changed to 3fea657db3fabd8abb5b664558d5b31861d2c942b7b490d2d9dfed4c548ce3a9
NOTE: recipe wayland-protocols-1.32-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_254.4-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1399 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch)
NOTE: Running task 1400 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: Running task 1401 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_patch)
NOTE: Running task 1402 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: Running task 1403 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1404 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: Running task 1405 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_unpack)
NOTE: Running task 1407 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1409 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_fetch)
NOTE: Running task 1412 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_unpack)
NOTE: Running task 1425 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_unpack)
NOTE: Running task 1428 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_unpack)
NOTE: Running task 1431 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_unpack)
NOTE: Running task 1466 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_unpack)
NOTE: Running task 1499 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1509 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_write_config)
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Started
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz_bad-checksum_541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libxcb-1.16-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Started
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Started
NOTE: Running task 1510 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_write_config)
NOTE: recipe dbus-1.14.10-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_unpack)
NOTE: Running task 1528 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_write_config)
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_write_config: Succeeded
NOTE: Running task 1529 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1530 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1550 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_patch)
NOTE: Running task 1571 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_warn_musl)
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_write_config)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_patch)
NOTE: Running task 1575 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 1576 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_patch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_write_config: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_write_config: Succeeded
NOTE: Running task 1601 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1612 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_fetch)
NOTE: Running task 1613 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libxcb-1.16-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Started
NOTE: Running task 1624 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_patch)
NOTE: Running task 1626 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_254.4-r0: task do_warn_musl: Succeeded
NOTE: Running task 1646 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_fetch)
NOTE: Running task 1648 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_fetch: Started
NOTE: Running task 1658 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1670 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_write_config)
NOTE: Running task 1671 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: recipe libxcb-1.16-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_write_config: Succeeded
NOTE: Running task 1675 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.40-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_fetch: Succeeded
NOTE: Running task 1677 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_fetch)
NOTE: Running task 1679 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_unpack)
NOTE: recipe dbus-1.14.10-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1700 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_patch)
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe bluez5-5.70-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: Running task 1741 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 1748 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: Running task 1764 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_fetch)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 1765 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_unpack)
NOTE: Running task 1766 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1767 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libical-3.0.17-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Started
NOTE: Running task 1770 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Started
NOTE: Running task 1791 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.118-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1794 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.118-r0: task do_fetch: Succeeded
NOTE: Running task 1795 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1796 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Started
NOTE: Running task 1797 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.10-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_fetch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1837 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_unpack)
NOTE: recipe libical-3.0.17-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1845 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1846 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1847 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1848 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: Running task 1849 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_unpack: Started
NOTE: Running task 1850 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1851 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_unpack: Succeeded
NOTE: Running task 1852 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_patch)
NOTE: recipe libdrm-2.4.118-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1853 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libical-3.0.17-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1854 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_generate_toolchain_file)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: Running task 1886 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_unpack)
NOTE: Running task 1899 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_fetch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1902 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_patch)
NOTE: Running task 1903 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.60.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1904 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1923 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_fetch)
NOTE: Running task 1924 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Started
NOTE: recipe bluez5-5.70-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_patch)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Started
NOTE: Running task 1928 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1929 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Started
NOTE: recipe ell-0.60-r0: task do_fetch: Started
NOTE: Running task 1934 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_write_config)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1951 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.118-r0: task do_patch: Started
NOTE: Running task 1952 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe ell-0.60-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1953 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.60.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_patch: Succeeded
NOTE: Running task 1977 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.1-r0: task do_fetch: Started
NOTE: Running task 2034 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_write_config)
NOTE: recipe bluez5-5.70-r0: task do_patch: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: Running task 2062 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_fetch)
NOTE: Running task 2064 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_fetch)
NOTE: recipe ofono-2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 2065 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.118-r0: task do_write_config: Started
NOTE: recipe ell-0.60-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_fetch)
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2073 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_recipe_qa)
NOTE: recipe libdrm-2.4.118-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Started
NOTE: Running task 2167 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_write_config)
NOTE: Running task 2172 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_write_config)
NOTE: recipe ofono-2.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2173 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_patch)
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Started
NOTE: recipe qemu-8.1.3-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_patch)
NOTE: recipe ell-0.60-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2175 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.60.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2177 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_patch)
NOTE: Running task 2178 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_write_config)
NOTE: Running task 2179 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_unpack)
NOTE: recipe libslirp-4.7.0-r0: task do_write_config: Started
NOTE: recipe libslirp-4.7.0-r0: task do_fetch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Started
NOTE: Running task 2217 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_unpack)
NOTE: recipe dtc-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 2254 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_unpack)
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Started
NOTE: recipe ofono-2.1-r0: task do_unpack: Succeeded
NOTE: recipe qemu-8.1.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2437 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.1.bb:do_patch)
NOTE: Running task 2447 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_fetch)
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Started
NOTE: recipe libslirp-4.7.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Started
NOTE: recipe ell-0.60-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_write_config: Succeeded
NOTE: Running task 2449 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: recipe pixman-1_0.42.2-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.60-r0: task do_patch: Succeeded
NOTE: Running task 2451 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_patch)
NOTE: recipe ofono-2.1-r0: task do_patch: Started
NOTE: recipe qemu-8.1.3-r0: task do_fetch: Started
NOTE: recipe systemd-1_254.4-r0: task do_unpack: Succeeded
NOTE: Running task 2453 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_254.4.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe qemu-8.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2454 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_unpack)
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ofono-2.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_254.4-r0: task do_patch: Started
NOTE: recipe qemu-8.1.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2457 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_git.bb:do_patch)
NOTE: recipe dtc-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.0.bb:do_patch)
NOTE: recipe libslirp-4.7.0-r0: task do_patch: Started
NOTE: recipe dtc-1.7.0-r0: task do_patch: Started
NOTE: recipe systemd-1_254.4-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.7.0-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2462 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_patch)
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Started
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum failure encountered with download of https://download.qemu.org/qemu-8.1.2.tar.xz - will attempt other sources if available
NOTE: recipe mesa-2_23.2.1-r0: task do_patch: Succeeded
WARNING: qemu-native-8.1.2-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz
Cleaning and trying again.
WARNING: qemu-native-8.1.2-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz to /srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz_bad-checksum_541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087
NOTE: recipe qemu-8.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2464 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_patch)
NOTE: recipe qemu-8.1.3-r0: task do_patch: Started
NOTE: recipe qemu-8.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2465 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2466 of 2875 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_8.1.3.bb:do_populate_lic)
NOTE: recipe qemu-8.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-8.1.3-r0: task do_populate_lic: Started
NOTE: recipe qemu-8.1.3-r0: task do_populate_lic: Succeeded
NOTE: recipe qemu-8.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe qemu-native-8.1.2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 2466 tasks of which 2334 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201093447.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201093447.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: qemu-native-8.1.2-r0 do_fetch: Checksum failure fetching https://download.qemu.org/qemu-8.1.2.tar.xz
ERROR: qemu-native-8.1.2-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/qemu-8.1.2.tar.xz\' has sha256 checksum \'541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087\' when \'43cc176804105586f74f90398f34e9f85787dff400d3b640d81f7779fbe265bb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "541526a764576eb494d2ff5ec46aeb253e62ea29035d1c23c0a8af4e6cd4f087"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://download.qemu.org/qemu-8.1.2.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/qemu-native/8.1.2/temp/log.do_fetch.741377
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_fetch) failed with exit code '1'

--===============5520936026048431277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-upgrade-8.1.2-8.1.3.patch"

RnJvbSA0MTE3ZDI3OTU5MTA4YzU2ZDU0ZDQ1YTU2ZDMyOGY5N2YzNWMzYzhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwOTozNToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXU6IHVwZ3JhZGUgOC4xLjIgLT4gOC4xLjMKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS97cWVtdV84LjEuMi5iYiA9PiBxZW11XzguMS4zLmJifSB8IDAKIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV84LjEuMi5iYiA9PiBxZW11XzguMS4zLmJifSAoMTAw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCmluZGV4IDVhYjJjYjgzYjQuLmQ2YTNj
ZjQ3YjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCkBAIC0zNyw3ICszNyw3IEBA
IFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6
IFwKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50
YXIiCiAKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU0MTUyNmE3NjQ1NzZlYjQ5NGQyZmY1ZWM0
NmFlYjI1M2U2MmVhMjkwMzVkMWMyM2MwYThhZjRlNmNkNGYwODciCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNDNjYzE3NjgwNDEwNTU4NmY3NGY5MDM5OGYzNGU5Zjg1Nzg3ZGZmNDAwZDNiNjQwZDgx
Zjc3NzlmYmUyNjViYiIKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBmaWxlOi8v
Y3Jvc3MucGF0Y2giCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIGZpbGU6Ly9j
cm9zcy5wYXRjaCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVf
OC4xLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzguMS4zLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11XzguMS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11Xzgu
MS4zLmJiCi0tIAoyLjM5LjIKCg==

--===============5520936026048431277==--

