Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.868.1608060223398260149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 74A7338C13E2
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:43 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.5.2 FAILED
Message-ID: <MADEUP.1650FA40F6BE91F8.26086@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6144165043775500243=="

--===============6144165043775500243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.5.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake dnf' failed
Loading cache...done.
Loaded 1425 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-5c15cd0ca06c91232af73e8447ce5cf1794843b3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5c15cd0ca06c91232af73e8447ce5cf1794843b3"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 314 Found 185 Missed 129 Current 491 (58% match, 83% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 626 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.182-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1045 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1122 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_fetch)
NOTE: Running task 1123 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_fetch)
NOTE: Running task 1124 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1132 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1133 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_fetch)
NOTE: Running task 1140 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1141 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_fetch)
NOTE: Running task 1149 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_fetch)
NOTE: Running task 1165 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_fetch)
NOTE: Running task 1173 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1175 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_fetch)
NOTE: Running task 1179 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_fetch)
NOTE: Running task 1183 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_fetch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1208 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 1219 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_fetch)
NOTE: Running task 1220 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_fetch)
NOTE: Running task 1221 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: Running task 1237 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running task 1240 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_fetch)
NOTE: Running task 1241 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 1270 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: Running task 1275 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_fetch)
NOTE: Running task 1276 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_fetch)
NOTE: Running task 1298 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_fetch)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: Running task 1320 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_fetch)
NOTE: Running task 1321 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_fetch)
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 1345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe file-5.39-r0: task do_fetch: Started
NOTE: Running task 1352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_fetch)
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Started
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_fetch: Started
NOTE: recipe json-c-0.15-r0: task do_fetch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Started
NOTE: recipe binutils-native-2.35-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe swig-native-3.0.12-r0: task do_fetch: Started
NOTE: Running task 1410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_fetch)
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: Running task 1449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_fetch)
NOTE: recipe dnf-4.4.0-r0: task do_fetch: Started
NOTE: recipe binutils-native-2.35-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_write_config: Started
NOTE: Running task 1482 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_unpack)
NOTE: Running task 1483 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: Running task 1511 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: Running task 1512 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_fetch: Succeeded
NOTE: Running task 1521 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: Running task 1522 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_write_config: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: Running task 1556 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Started
NOTE: Running task 1557 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_unpack)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1572 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: Running task 1573 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_fetch: Succeeded
NOTE: Running task 1575 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_unpack)
NOTE: recipe librepo-1.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1581 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_unpack)
NOTE: recipe file-5.39-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1591 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_unpack)
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Started
NOTE: Running task 1592 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-native-2.35-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1638 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_unpack)
NOTE: recipe binutils-native-2.35-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1661 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: Running task 1734 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_unpack)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1781 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: Running task 1782 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 772 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Started
NOTE: Running task 1820 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.39-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1884 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 9e0ccd6495d4c59f683fde033d2ed95c9e980d04d25ece6cdb5c686481e71779. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-native-2.35-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 780 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Started
NOTE: recipe python3-six-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_unpack: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1890 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_patch)
NOTE: Running task 1891 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_unpack)
NOTE: recipe json-c-0.15-r0: task do_fetch: Succeeded
NOTE: Running task 1892 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_unpack)
NOTE: Running task 1893 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_patch)
NOTE: Running task 1895 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.16-r0: task do_fetch: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 788 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 789 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1901 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Started
NOTE: Running task 1906 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Started
NOTE: recipe json-c-0.15-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_patch)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 9e0ccd6495d4c59f683fde033d2ed95c9e980d04d25ece6cdb5c686481e71779. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe libmodulemd-2.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running setscene task 790 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1909 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1910 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_unpack)
NOTE: Running task 1911 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1949 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_patch: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1990 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1991 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_unpack)
NOTE: Running task 1992 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk-doc-1.33.1-r0: task do_unpack: Succeeded
NOTE: Running task 1994 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_patch)
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 793 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.39-r0: task do_unpack: Succeeded
NOTE: Running task 2007 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2008 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_unpack: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 797 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2009 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_patch)
NOTE: Running task 2010 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_unpack)
NOTE: recipe libcheck-0.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2011 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_patch)
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_patch: Succeeded
NOTE: Running task 2016 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_generate_toolchain_file)
NOTE: Running task 2017 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libksba-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe npth-1.6-r0: task do_unpack: Started
NOTE: Running task 2018 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_unpack)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_unpack: Succeeded
NOTE: Running task 2019 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_patch)
NOTE: recipe librepo-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2020 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_generate_toolchain_file)
NOTE: Running task 2021 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Started
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 2022 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.39-r0: task do_patch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Started
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 2023 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2025 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_unpack: Succeeded
NOTE: Running task 2045 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Started
NOTE: recipe file-5.39-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pinentry-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2051 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2052 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: Running task 2053 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_patch)
NOTE: Running setscene task 800 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_patch: Succeeded
NOTE: Running task 2054 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_patch)
NOTE: recipe libcomps-0.1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2055 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_generate_toolchain_file)
NOTE: Running setscene task 803 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2056 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_deploy_source_date_epoch)
NOTE: recipe npth-1.6-r0: task do_patch: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe json-c-0.15-r0: task do_patch: Succeeded
NOTE: Running task 2057 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_generate_toolchain_file)
NOTE: Running task 2058 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_patch: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2059 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Started
NOTE: recipe dnf-4.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2060 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Started
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Started
NOTE: recipe libcheck-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: Running task 2061 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe rpm-1_4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_patch: Succeeded
NOTE: Running task 2062 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 2063 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2064 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_patch)
NOTE: recipe libksba-1.4.0-r0: task do_patch: Started
NOTE: Running task 2065 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2066 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.15-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_patch: Succeeded
NOTE: recipe libsolv-0.7.16-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2083 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe dnf-4.4.0-r0: task do_unpack: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Started
NOTE: Running task 2100 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_configure)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 805 of 805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: Running task 2102 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_unpack: Started
NOTE: recipe json-c-0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libassuan-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 2105 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_patch)
NOTE: recipe libsolv-0.7.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2106 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Started
NOTE: Running task 2107 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libksba-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2108 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk-doc-1.33.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2109 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_configure)
NOTE: recipe dnf-4.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2110 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.15-r0: task do_configure: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: recipe libcheck-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2223 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Started
NOTE: recipe dnf-4.4.0-r0: task do_patch: Started
NOTE: Running task 2256 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe libassuan-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_patch: Succeeded
NOTE: Running task 2278 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_generate_toolchain_file)
NOTE: Running task 2279 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2280 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Started
NOTE: Running task 2281 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: recipe npth-1.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 2282 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe libksba-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2283 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Started
NOTE: recipe libdnf-0.55.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe swig-native-3.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 2284 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_unpack)
NOTE: Running task 2285 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-six-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2286 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe libdnf-0.55.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 2287 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pinentry-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe swig-native-3.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe swig-native-3.0.12-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dnf-4.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2288 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_generate_toolchain_file)
NOTE: Running task 2289 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2290 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2293 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe dnf-4.4.0-r0: task do_populate_lic: Started
NOTE: recipe dnf-4.4.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe dnf-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe swig-native-3.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_fetch: Succeeded
NOTE: Running task 2294 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_patch)
NOTE: recipe dnf-4.4.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.4.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2295 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2296 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_unpack)
NOTE: recipe swig-native-3.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dnf-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2297 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Started
NOTE: recipe python3-six-1.15.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe swig-native-3.0.12-r0: task do_patch: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-native-2.35-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_patch)
NOTE: recipe binutils-native-2.35-r0: task do_patch: Started
NOTE: recipe swig-native-3.0.12-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2301 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package)
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package: Started
NOTE: recipe swig-native-3.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe swig-native-3.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_configure)
NOTE: recipe python3-six-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2303 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe swig-native-3.0.12-r0: task do_configure: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_unpack: Succeeded
NOTE: Running task 2304 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_patch)
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Started
NOTE: recipe binutils-native-2.35-r0: task do_patch: Succeeded
NOTE: Running task 2305 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-native-2.35-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-native-2.35-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2306 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_patch: Succeeded
NOTE: Running task 2307 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata)
NOTE: recipe python3-iniparse-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2309 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_configure)
NOTE: recipe binutils-native-2.35-r0: task do_configure: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniparse-0.4-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2311 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_compile: Succeeded
NOTE: Running task 2312 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_install)
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2313 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_configure: Succeeded
NOTE: Running task 2314 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_compile)
NOTE: recipe json-c-0.15-r0: task do_compile: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_install: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2315 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package)
NOTE: Running task 2316 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_populate_sysroot)
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_install)
NOTE: recipe json-c-0.15-r0: task do_install: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.15-r0: task do_install: Succeeded
NOTE: Running task 2318 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_populate_sysroot)
NOTE: Running task 2319 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package)
NOTE: recipe json-c-0.15-r0: task do_package: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-native-2.35-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_compile)
NOTE: recipe python3-iniparse-0.4-r0: task do_package: Succeeded
NOTE: Running task 2321 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_packagedata)
NOTE: recipe binutils-native-2.35-r0: task do_compile: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2322 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniparse_0.4.bb:do_package_write_rpm)
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniparse-0.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe json-c-0.15-r0: task do_package: Succeeded
NOTE: Running task 2324 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_packagedata)
NOTE: recipe json-c-0.15-r0: task do_packagedata: Started
NOTE: recipe json-c-0.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2325 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/json-c/json-c_0.15.bb:do_package_write_rpm)
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Started
NOTE: recipe json-c-0.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2326 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 2327 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2328 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: Running task 2330 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_install: Succeeded
NOTE: Running task 2332 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_populate_sysroot)
NOTE: Running task 2333 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package)
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe npth-1.6-r0: task do_configure: Succeeded
NOTE: Running task 2334 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: Running task 2335 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: recipe npth-1.6-r0: task do_compile: Started
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe npth-1.6-r0: task do_compile: Succeeded
NOTE: Running task 2336 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_install)
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: Running task 2337 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_populate_sysroot)
NOTE: Running task 2338 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package)
NOTE: recipe popt-1.18-r0: task do_package: Started
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Started
NOTE: recipe npth-1.6-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2339 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe npth-1.6-r0: task do_install: Succeeded
NOTE: Running task 2340 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package)
NOTE: Running task 2341 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe npth-1.6-r0: task do_package: Started
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2342 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package_write_rpm)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk-doc-1.33.1-r0: task do_package: Succeeded
NOTE: Running task 2343 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Started
NOTE: recipe gtk-doc-1.33.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.1.bb:do_package_write_rpm)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe popt-1.18-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.39-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_compile)
NOTE: recipe swig-native-3.0.12-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_compile)
NOTE: recipe gtk-doc-1.33.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Started
NOTE: recipe swig-native-3.0.12-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_packagedata)
NOTE: recipe popt-1.18-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2349 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Started
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe npth-1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2351 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/npth/npth_1.6.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Started
NOTE: recipe popt-1.18-r0: task do_packagedata: Succeeded
NOTE: Running task 2352 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Started
NOTE: recipe npth-1.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe file-5.39-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_install: Started
NOTE: recipe file-5.39-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package)
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.39-r0: task do_package: Started
NOTE: recipe file-5.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2356 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_install)
NOTE: recipe libcheck-0.15.2-r0: task do_install: Started
NOTE: recipe swig-native-3.0.12-r0: task do_compile: Succeeded
NOTE: Running task 2357 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_install)
NOTE: recipe swig-native-3.0.12-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2358 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot)
NOTE: Running task 2359 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package)
NOTE: recipe libcheck-0.15.2-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2360 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 2361 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe file-5.39-r0: task do_package: Succeeded
NOTE: Running task 2362 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: Running task 2363 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_configure)
NOTE: recipe file-5.39-r0: task do_packagedata: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2364 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.39.bb:do_package_write_rpm)
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Started
NOTE: recipe libcomps-0.1.15-r0: task do_configure: Succeeded
NOTE: Running task 2365 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2368 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2369 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2370 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2371 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_compile: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2372 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2373 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_install: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2374 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2375 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_configure)
NOTE: recipe libksba-1.4.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2376 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe file-5.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_install: Succeeded
NOTE: Running task 2377 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package)
NOTE: Running task 2378 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package: Started
NOTE: recipe libcheck-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libcomps-0.1.15-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe swig-native-3.0.12-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/swig/swig_3.0.12.bb:do_populate_sysroot)
NOTE: recipe libcomps-0.1.15-r0: task do_package: Succeeded
NOTE: Running task 2381 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_packagedata)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Started
NOTE: recipe swig-native-3.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2382 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libcomps-0.1.15-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Started
NOTE: recipe swig-native-3.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe libcomps-0.1.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_compile)
NOTE: recipe libksba-1.4.0-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2387 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_compile)
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2388 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_install)
NOTE: recipe libassuan-2.5.4-r0: task do_install: Started
NOTE: recipe libksba-1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2389 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_install)
NOTE: recipe libksba-1.4.0-r0: task do_install: Started
NOTE: recipe libassuan-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 2390 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 2391 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package)
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Started
NOTE: recipe libksba-1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2392 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package)
NOTE: Running task 2393 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_populate_sysroot)
NOTE: recipe libassuan-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_package: Started
NOTE: Running task 2395 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libksba-1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pinentry-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_configure)
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Started
NOTE: recipe gpgme-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_configure)
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 2398 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe libassuan-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2400 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libassuan/libassuan_2.5.4.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2401 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_packagedata)
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Started
NOTE: recipe libksba-1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libksba/libksba_1.4.0.bb:do_package_write_rpm)
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe libassuan-2.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libksba-1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-native-2.35-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_install)
NOTE: recipe binutils-native-2.35-r0: task do_install: Started
NOTE: recipe pinentry-1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2404 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_compile)
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Started
NOTE: recipe pinentry-1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2405 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_install)
NOTE: recipe pinentry-1.1.0-r0: task do_install: Started
NOTE: recipe pinentry-1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2406 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package)
NOTE: recipe pinentry-1.1.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe pinentry-1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2410 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_packagedata)
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Started
NOTE: recipe pinentry-1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/pinentry/pinentry_1.1.0.bb:do_package_write_rpm)
NOTE: recipe binutils-native-2.35-r0: task do_install: Succeeded
NOTE: Running task 2412 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_populate_sysroot)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-native-2.35-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2413 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2414 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-native-2.35-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe pinentry-1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2416 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_configure)
NOTE: recipe gnupg-2.2.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2417 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_configure)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 2418 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2420 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2421 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_compile)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_compile: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_install)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_install: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2490 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot)
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_populate_sysroot: Started
NOTE: recipe prelink-native-1.0+gitAUTOINC+f9975537db-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2425 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2426 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
NOTE: recipe gnupg-2.2.23-r0: task do_configure: Succeeded
NOTE: Running task 2427 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_compile)
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2428 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_compile)
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Started
NOTE: recipe gnupg-2.2.23-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_install)
NOTE: recipe rpm-1_4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2434 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnupg-2.2.23-r0: task do_install: Succeeded
NOTE: Running task 2435 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_configure)
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.16-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_compile)
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2439 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2440 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.16.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe gnupg-2.2.23-r0: task do_package: Succeeded
NOTE: Running task 2441 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_packagedata)
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2442 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: Running task 2443 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Started
NOTE: recipe gnupg-2.2.23-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnupg/gnupg_2.2.23.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Started
NOTE: recipe libsolv-0.7.16-r0: task do_compile: Succeeded
NOTE: Running task 2445 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_install)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2446 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_install: Succeeded
NOTE: Running task 2447 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_populate_sysroot)
NOTE: Running task 2448 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package)
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Started
NOTE: recipe libsolv-0.7.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2449 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Started
NOTE: recipe rpm-1_4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2452 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package: Succeeded
NOTE: Running task 2453 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_packagedata)
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2454 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libsolv/libsolv_0.7.16.bb:do_package_write_rpm)
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2455 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_install)
NOTE: recipe gpgme-1.15.0-r0: task do_install: Started
NOTE: recipe libsolv-0.7.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2456 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package)
NOTE: recipe gnupg-2.2.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package: Started
NOTE: recipe gpgme-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2458 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_install: Succeeded
NOTE: Running task 2460 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2461 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe librepo-1.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_configure)
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Started
NOTE: recipe librepo-1.12.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gpgme-1.15.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_compile)
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Started
NOTE: recipe gpgme-1.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2465 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gpgme/gpgme_1.15.0.bb:do_package_write_rpm)
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2466 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_install)
NOTE: recipe librepo-1.12.1-r0: task do_install: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package)
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package_write_rpm)
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2471 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.9.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_configure)
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Started
NOTE: recipe librepo-1.12.1-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_packagedata)
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Started
NOTE: recipe librepo-1.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/librepo/librepo_1.12.1.bb:do_package_write_rpm)
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gpgme-1.15.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe librepo-1.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_configure: Succeeded
NOTE: Running task 2475 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_compile)
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Started
NOTE: recipe libdnf-0.55.0-r0: task do_compile: Succeeded
NOTE: Running task 2476 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_install)
NOTE: recipe libdnf-0.55.0-r0: task do_install: Started
NOTE: recipe libdnf-0.55.0-r0: task do_install: Succeeded
NOTE: Running task 2477 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package)
NOTE: Running task 2478 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.55.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.55.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2479 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_configure)
NOTE: recipe dnf-4.4.0-r0: task do_configure: Started
NOTE: recipe dnf-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_compile)
NOTE: recipe dnf-4.4.0-r0: task do_compile: Started
NOTE: recipe dnf-4.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_install)
NOTE: recipe dnf-4.4.0-r0: task do_install: Started
NOTE: recipe dnf-4.4.0-r0: task do_install: Succeeded
NOTE: Running task 2483 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_populate_sysroot)
NOTE: recipe dnf-4.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_packagedata)
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.55.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_package)
NOTE: Running task 2486 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libdnf/libdnf_0.55.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.4.0-r0: task do_package: Started
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.4.0-r0: task do_package: Succeeded
NOTE: Running task 2487 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_packagedata)
NOTE: recipe dnf-4.4.0-r0: task do_packagedata: Started
NOTE: recipe dnf-4.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_package_write_rpm)
NOTE: Running task 2489 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_package_qa)
NOTE: recipe dnf-4.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.4.0-r0: task do_package_qa: Started
NOTE: recipe dnf-4.4.0-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.55.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2490 of 2490 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/dnf/dnf_4.4.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2490 tasks of which 2156 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages shown, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6144165043775500243==--
