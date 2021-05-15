Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.4491.1621074783398317594
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2D4BB38C125F
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:04 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] curl: upgrading to 7.76.1 FAILED
Message-ID: <MADEUP.167F36EDF1E70FBA.8589@lists.openembedded.org>
X-Groupsio-MsgNum: 151842
Content-Type: multipart/mixed; boundary="===============8795283961292792955=="

--===============8795283961292792955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *curl* to *7.76.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-curl-upgrade-7.76.0-7.76.1.patch
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

--===============8795283961292792955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1461 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-040121ed5c8d80faae415b7d7faa1c2a97e83302"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040121ed5c8d80faae415b7d7faa1c2a97e83302"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 73 Local 6 Network 0 Missed 67 Current 647 (8% match, 90% complete)
Removing 19 stale sstate objects for arch qemux86_64...done.
Removing 31 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 668 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 817 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1015 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_fetch)
NOTE: Running task 1103 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_fetch)
NOTE: Running task 1124 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_fetch: Started
NOTE: recipe curl-7.76.1-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_unpack)
NOTE: Running task 1195 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_unpack)
NOTE: Running task 1232 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_write_config)
NOTE: Running task 1322 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_unpack: Started
NOTE: recipe curl-7.76.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_write_config: Started
NOTE: recipe curl-7.76.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_write_config: Succeeded
NOTE: Running task 1652 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_fetch)
NOTE: recipe expat-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1913 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_configure)
NOTE: Running task 1914 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Started
NOTE: recipe iproute2-5.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2020 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_unpack)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_patch: Started
NOTE: recipe expat-2.3.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2122 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Started
NOTE: recipe curl-7.76.1-r0: task do_unpack: Succeeded
NOTE: Running task 2123 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_patch)
NOTE: recipe iproute2-5.11.0-r0: task do_patch: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_patch: Started
NOTE: recipe curl-7.76.1-r0: task do_patch: Succeeded
NOTE: Running task 2125 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2126 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe curl-7.76.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.76.1-r0: task do_populate_lic: Started
NOTE: recipe curl-7.76.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_populate_lic unihash changed to 596d8bf58dac21279e40cb501ba1c0949b6da01d05f85ec20df729216beffb68
NOTE: recipe curl-7.76.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2127 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2128 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2129 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe curl-7.76.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to fdc085f12a4d811512eea39b42cb39da3075c7dd059d1ed45cec0a329ddedd03
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2130 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe expat-2.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5cb53070dbb10dcbca6c781f2d0d18a10bbd606585db2df219cbfd8496662dbf
NOTE: Setscene tasks completed
NOTE: Running task 2132 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe expat-2.3.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.3.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2134 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe expat-2.3.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.3.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.3.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2136 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_install)
NOTE: recipe expat-2.3.0-r0: task do_install: Started
NOTE: recipe expat-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2137 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.3.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.3.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2138 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2139 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package)
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.3.0-r0: task do_package: Started
NOTE: recipe expat-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_populate_sysroot unihash changed to 4dcaa6a19d85ef41e531066da6c64cda676d5f99116dadf75efa0dbe5e87da6b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 730 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 757 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package: Succeeded
NOTE: Running task 2148 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.3.0-r0: task do_packagedata: Started
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_packagedata unihash changed to 7f684c547e2ac2c0a12a2db3b353d488c0ce6161379b130a5de026bcd8447996
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata became valid
NOTE: Running setscene task 759 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 760 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 762 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_setscene)
NOTE: Running setscene task 765 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 766 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 767 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_setscene)
NOTE: Running setscene task 768 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 770 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 771 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 772 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_setscene)
NOTE: Running setscene task 773 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 774 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_setscene)
NOTE: Running setscene task 776 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 777 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_setscene)
NOTE: Running setscene task 778 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 779 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running task 2149 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_package_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 780 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 781 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 782 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 783 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.3.0.bb:do_package_write_rpm unihash changed to dcdff6b438f9f6ebd13689804cf829c2741d47c153581f787ddf99b7f0a44e40
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 787 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.6-r0: task do_packagedata_setscene: Succeeded
ERROR: glib-2.0-1_2.68.1-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass', lineno: 322, function: buildhistory_emit_pkghistory
     0318:
     0319:        write_pkghistory(pkginfo, d)
     0320:
     0321:    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
 *** 0322:    bb.build.exec_func("buildhistory_list_pkg_files", d)
     0323:}
     0324:
     0325:python buildhistory_emit_outputsigs() {
     0326:    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 256, function: exec_func
     0252:    with bb.utils.fileslocked(lockfiles):
     0253:        if ispython:
     0254:            exec_func_python(func, d, runfile, cwd=adir)
     0255:        else:
 *** 0256:            exec_func_shell(func, d, runfile, cwd=adir)
     0257:
     0258:    try:
     0259:        curcwd = os.getcwd()
     0260:    except:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/build.py', lineno: 503, function: exec_func_shell
     0499:    with open(fifopath, 'r+b', buffering=0) as fifo:
     0500:        try:
     0501:            bb.debug(2, "Executing shell function %s" % func)
     0502:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0503:                bb.process.run(cmd, shell=False, stdin=stdin, log=logfile, extrafiles=[(fifo,readfifo)])
     0504:        except bb.process.ExecutionError as exe:
     0505:            # Find the backtrace that the shell trap generated
     0506:            backtrace_marker_regex = re.compile(r"WARNING: Backtrace \(BB generated script\)")
     0507:            stdout_lines = (exe.stdout or "").split("\n")
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/process.py', lineno: 184, function: run
     0180:        if not stderr is None:
     0181:            stderr = stderr.decode("utf-8")
     0182:
     0183:    if pipe.returncode != 0:
 *** 0184:        raise ExecutionError(cmd, pipe.returncode, stdout, stderr)
     0185:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725' failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725: line 171: cd: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/packages-split/glib-2.0-locale-en+shaw: No such file or directory
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725:168 exit 1 from 'buildhistory_list_files $pkgdir $outfile fakeroot'
WARNING: Backtrace (BB generated script): 
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725, line 168
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725, line 163
	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/run.buildhistory_list_pkg_files.142725, line 212

Backtrace (metadata-relative locations):
	#1: buildhistory_list_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 548
	#2: buildhistory_list_pkg_files, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass, line 585

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glib-2.0/1_2.68.1-r0/temp/log.do_packagedata_setscene.142725
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_package_setscene: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 790 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 793 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2205 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.1-r0: task do_packagedata: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_configure: Succeeded
NOTE: Running task 2227 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_compile)
NOTE: recipe curl-7.76.1-r0: task do_compile: Started
NOTE: recipe curl-7.76.1-r0: task do_compile: Succeeded
NOTE: Running task 2228 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_install)
NOTE: recipe curl-7.76.1-r0: task do_install: Started
NOTE: recipe curl-7.76.1-r0: task do_install: Succeeded
NOTE: Running task 2229 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_populate_sysroot)
NOTE: Running task 2230 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package)
NOTE: recipe curl-7.76.1-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.76.1-r0: task do_package: Started
NOTE: recipe curl-7.76.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2231 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2232 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_configure: Started
NOTE: recipe curl-7.76.1-r0: task do_package: Succeeded
NOTE: Running task 2233 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_packagedata)
NOTE: recipe curl-7.76.1-r0: task do_packagedata: Started
NOTE: recipe curl-7.76.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_write_rpm)
NOTE: Running task 2235 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_package_qa)
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.76.1-r0: task do_package_qa: Started
NOTE: recipe curl-7.76.1-r0: task do_package_qa: Succeeded
NOTE: recipe curl-7.76.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_compile: Succeeded
NOTE: Running task 2237 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_install: Succeeded
NOTE: Running task 2238 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot)
NOTE: Running task 2239 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot unihash changed to b83a872d2c0d5bf4619e5c132dd46fb8d52a14f698d8f732e3ec66b67b2ce50f
NOTE: Setscene tasks completed
NOTE: Running task 2240 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.183-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.183-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2241 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_configure)
NOTE: recipe elfutils-0.183-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package: Succeeded
NOTE: Running task 2242 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata unihash changed to 09a9309147378b75501b9b54827113bfe025d1d3d04f6c12375d0ca79d591997
NOTE: Setscene tasks completed
NOTE: Running task 2243 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm unihash changed to 90885daa90b0ee95c2a766c888719076cf5380ebe0616f63a12e6ec868d4a902
NOTE: recipe elfutils-0.183-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2244 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.183-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.183-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2245 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_compile)
NOTE: recipe elfutils-0.183-r0: task do_compile: Started
NOTE: recipe elfutils-0.183-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.183-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.183-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2247 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_install)
NOTE: recipe elfutils-0.183-r0: task do_install: Started
NOTE: recipe elfutils-0.183-r0: task do_install: Succeeded
NOTE: Running task 2248 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.183-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.183-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2249 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package)
NOTE: Running task 2250 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.183-r0: task do_package: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.183-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_populate_sysroot unihash changed to 01cac194d909c29d73bb0c7ef56bff21dc9e0bab34408955f1f8360ff20aefe2
NOTE: Setscene tasks completed
NOTE: Running task 2251 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2256 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_configure)
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.11.0-r0: task do_configure: Succeeded
NOTE: Running task 2257 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_compile)
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Started
NOTE: recipe iproute2-5.11.0-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_install)
NOTE: recipe iproute2-5.11.0-r0: task do_install: Started
NOTE: recipe iproute2-5.11.0-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package: Succeeded
NOTE: Running task 2259 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata)
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata: Succeeded
NOTE: Running task 2260 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package)
NOTE: Running task 2261 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package)
NOTE: recipe iproute2-5.11.0-r0: task do_package: Started
NOTE: recipe binutils-2.36.1-r0: task do_package: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package: Succeeded
NOTE: Running task 2262 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata)
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata unihash changed to 3da7fcaf4da24b435adf72de75ea8e5176cdeaa37d344dd162cc1e5614eacd9e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm became valid
NOTE: Running setscene task 828 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 2263 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm)
NOTE: Running task 2264 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm unihash changed to 2b41ae8958694f9d1158a89fcc2604248438d3ed2e00e80787c997fe61e662da
NOTE: recipe binutils-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata unihash changed to 07753251f65f869d19d87344a358913b4be713350b301881fc0dd59bb3b66866
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 831 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2267 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm unihash changed to 254f72fda7af566e019cfa737c20bcdce4eceb2bfa560e7004474339f5fa3de7
NOTE: Running noexec task 2269 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.76.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2269 tasks of which 2201 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8795283961292792955==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-curl-upgrade-7.76.0-7.76.1.patch"

From 680541fcc826e7a90af65c2e719f2e1154335581 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 09:51:48 +0000
Subject: [PATCH] curl: upgrade 7.76.0 -> 7.76.1

---
 meta/recipes-support/curl/{curl_7.76.0.bb => curl_7.76.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.76.0.bb => curl_7.76.1.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.76.0.bb b/meta/recipes-support/curl/curl_7.76.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.76.0.bb
rename to meta/recipes-support/curl/curl_7.76.1.bb
index db6318148f..4e2c277010 100644
--- a/meta/recipes-support/curl/curl_7.76.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a"
+SRC_URI[sha256sum] = "7a8e184d7d31312c4ebf6a8cb59cd757e61b2b2833a9ed4f9bf708066e7695e9"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.27.0


--===============8795283961292792955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/curl/curl-dbg: PKGSIZE changed from 2595896 to 2597748 (+0%)
packages/core2-32-poky-linux/curl/curl-dbg: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-dbg: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl-dev: PKGSIZE changed from 235381 to 235390 (+0%)
packages/core2-32-poky-linux/curl/curl-dev: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-dev: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl-doc: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-doc: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl-locale: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-locale: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl-src: PKGSIZE changed from 3602194 to 3604647 (+0%)
packages/core2-32-poky-linux/curl/curl-src: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-src: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl-staticdev: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl-staticdev: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/curl: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/curl: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl: SRC_URI changed from "https://curl.haxx.se/download/curl-7.76.0.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch" to "https://curl.haxx.se/download/curl-7.76.1.tar.bz2 file://0001-replace-krb5-config-with-pkg-config.patch"
packages/core2-32-poky-linux/curl: PV changed from "7.76.0" to "7.76.1"
packages/core2-32-poky-linux/curl/libcurl: PKGV changed from 7.76.0 [default] to 7.76.1 [default]
packages/core2-32-poky-linux/curl/libcurl: PV changed from "7.76.0" to "7.76.1"

--===============8795283961292792955==--
