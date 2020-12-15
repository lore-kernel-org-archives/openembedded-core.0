Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.933.1608060223432712105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id AAE9038C16CC
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:46 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.74.0 FAILED
Message-ID: <MADEUP.1650FA42530C0D17.1152@lists.openembedded.org>
X-Groupsio-MsgNum: 145746
Content-Type: multipart/mixed; boundary="===============7430419473951088399=="

--===============7430419473951088399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.74.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.73.0-7.74.0.patch
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

--===============7430419473951088399==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.73.0-7.74.0.patch"

From 4a5923e58ba00e98212e290486fbc7303901e965 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 15 Dec 2020 18:35:29 +0000
Subject: [PATCH] curl: upgrade 7.73.0 -> 7.74.0

---
 meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.73.0.bb => curl_7.74.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.73.0.bb b/meta/recipes-support/curl/curl_7.74.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.73.0.bb
rename to meta/recipes-support/curl/curl_7.74.0.bb
index 0f26b0f1af..873bbe8143 100644
--- a/meta/recipes-support/curl/curl_7.73.0.bb
+++ b/meta/recipes-support/curl/curl_7.74.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
+SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.17.1


--===============7430419473951088399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1474 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1413 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-ba2d7608a2b6120f117c9bfb13f335446b9b41e3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ba2d7608a2b6120f117c9bfb13f335446b9b41e3"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 251 Found 194 Missed 57 Current 428 (77% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 444 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 470 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_setscene)
NOTE: Running setscene task 480 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 482 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_setscene)
NOTE: Running setscene task 483 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 585 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 611 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 614 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 2da9c58a898f074603537720066e76227ed1e6ed9b8cb467c045bc81edfd18df. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 584 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 700 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_write_config)
NOTE: Running task 729 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: Running task 731 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_fetch)
NOTE: Running task 742 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: Running task 752 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_fetch)
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 770 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_fetch)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 650 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 651 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: recipe curl-native-7.74.0-r0: task do_fetch: Started
NOTE: Running task 812 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 652 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_setscene: Started
NOTE: Running task 823 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_write_config)
NOTE: Running task 826 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_warn_musl)
NOTE: Running task 827 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_write_config)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-native-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 653 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: Running task 857 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: Running task 858 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 862 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_write_config)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running task 919 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_fetch)
NOTE: Running task 997 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_unpack)
NOTE: Running task 1020 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: Running task 1032 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1033 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 1039 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 658 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Started
NOTE: recipe systemd-1_246.6-r0: task do_write_config: Started
NOTE: recipe systemd-1_246.6-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Started
NOTE: recipe systemd-1_246.6-r0: task do_warn_musl: Started
NOTE: Running setscene task 659 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_warn_musl: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1182 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 2da9c58a898f074603537720066e76227ed1e6ed9b8cb467c045bc81edfd18df. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Started
NOTE: recipe systemd-1_246.6-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe curl-native-7.74.0-r0: task do_unpack: Started
NOTE: recipe curl-native-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-7.74.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Started
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 660 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1280 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_unpack)
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1290 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe wayland-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1294 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_unpack)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-native-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 664 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1323 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1324 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1325 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_patch)
NOTE: Running setscene task 666 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 1331 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 670 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1345 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: Running setscene task 672 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-7.74.0-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: recipe systemd-1_246.6-r0: task do_fetch: Succeeded
NOTE: Running task 1349 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_unpack)
NOTE: recipe curl-native-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_patch)
NOTE: recipe systemd-1_246.6-r0: task do_unpack: Started
NOTE: recipe curl-native-7.74.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_patch: Started
NOTE: recipe curl-native-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1364 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1369 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_patch)
NOTE: recipe curl-native-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.2.10-r0: task do_patch: Succeeded
NOTE: Running task 1370 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_generate_toolchain_file)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_patch: Started
NOTE: recipe curl-7.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_patch)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1378 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe curl-native-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_patch: Started
NOTE: Running task 1379 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1380 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe curl-native-7.74.0-r0: task do_configure: Started
NOTE: recipe wayland-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_lic)
NOTE: recipe btrfs-tools-5.9-r0: task do_fetch: Succeeded
NOTE: Running task 1396 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_unpack)
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_lic: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 675 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 676 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1399 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 678 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: Running task 1412 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.9-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: Running task 1862 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1863 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_patch)
NOTE: Running task 1870 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2020 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_configure)
NOTE: recipe btrfs-tools-5.9-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_configure: Started
NOTE: recipe systemd-1_246.6-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_patch)
NOTE: recipe systemd-1_246.6-r0: task do_patch: Started
NOTE: recipe systemd-1_246.6-r0: task do_patch: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2026 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2027 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-7.74.0-r0: task do_install: Started
NOTE: recipe curl-native-7.74.0-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_compile)
NOTE: recipe curl-native-7.74.0-r0: task do_compile: Started
NOTE: recipe curl-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2029 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package)
NOTE: Running task 2030 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package: Started
NOTE: recipe curl-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-native-7.74.0-r0: task do_compile: Succeeded
NOTE: Running task 2031 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_install)
NOTE: recipe curl-native-7.74.0-r0: task do_install: Started
NOTE: recipe curl-native-7.74.0-r0: task do_install: Succeeded
NOTE: Running task 2032 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_populate_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_package: Succeeded
NOTE: Running task 2033 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_packagedata)
NOTE: recipe curl-native-7.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Started
NOTE: recipe curl-native-7.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2034 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2035 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_write_rpm)
NOTE: Running task 2036 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_package_qa)
NOTE: recipe cmake-native-3.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.74.0-r0: task do_package_qa: Started
NOTE: recipe cmake-native-3.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2037 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_configure)
NOTE: recipe cmake-native-3.18.4-r0: task do_configure: Started
NOTE: recipe curl-7.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe curl-7.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cmake-native-3.18.4-r0: task do_configure: Succeeded
NOTE: Running task 2038 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_compile)
NOTE: recipe cmake-native-3.18.4-r0: task do_compile: Started
NOTE: recipe cmake-native-3.18.4-r0: task do_compile: Succeeded
NOTE: Running task 2039 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_install)
NOTE: recipe cmake-native-3.18.4-r0: task do_install: Started
NOTE: recipe cmake-native-3.18.4-r0: task do_install: Succeeded
NOTE: Running task 2040 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb:do_populate_sysroot)
NOTE: recipe cmake-native-3.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe cmake-native-3.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2041 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2042 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-native-2.2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2043 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure)
NOTE: recipe expat-2.2.10-r0: task do_configure: Started
NOTE: recipe expat-native-2.2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2044 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure)
NOTE: recipe expat-native-2.2.10-r0: task do_configure: Started
NOTE: recipe expat-2.2.10-r0: task do_configure: Succeeded
NOTE: Running task 2045 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_configure_ptest_base)
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2046 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile)
NOTE: recipe expat-2.2.10-r0: task do_compile: Started
NOTE: recipe expat-native-2.2.10-r0: task do_configure: Succeeded
NOTE: Running task 2047 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile)
NOTE: recipe expat-native-2.2.10-r0: task do_compile: Started
NOTE: recipe expat-native-2.2.10-r0: task do_compile: Succeeded
NOTE: Running task 2048 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install)
NOTE: recipe expat-native-2.2.10-r0: task do_install: Started
NOTE: recipe expat-native-2.2.10-r0: task do_install: Succeeded
NOTE: Running task 2049 of 2159 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot)
NOTE: recipe expat-native-2.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_compile: Succeeded
NOTE: Running task 2050 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_compile_ptest_base)
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2051 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install)
NOTE: recipe expat-native-2.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot unihash changed to 2439a6ab4a05314577610f631b986926da5cad4f2ef0115a3667cf81f175fd67
NOTE: recipe expat-2.2.10-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: recipe expat-2.2.10-r0: task do_install: Succeeded
NOTE: Running task 2067 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_install_ptest_base)
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.2.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2068 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot)
NOTE: Running task 2069 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_package: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot unihash changed to b128192a2a1eceac154e5a97142fe32ed8a965e530a2c5502ff9dbe4436d685e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot became valid
NOTE: Running setscene task 752 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package: Succeeded
NOTE: Running task 2070 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2071 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata unihash changed to ed093062c31efe5257ad533e7f2bbf77f27a421c4e3a8e118e23cff78e3bddbc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: Running task 2072 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package became valid
NOTE: Setscene tasks completed
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2073 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages shown, returning a non-zero exit code.

--===============7430419473951088399==--
