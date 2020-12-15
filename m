Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.933.1608060223432712105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5B0F438C1691
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:45 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 4170beab7ad585fc02beaacfb433d26cf0a2b9c7 FAILED
Message-ID: <MADEUP.1650FA418C29F44A.26086@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7616377455096349212=="

--===============7616377455096349212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *4170beab7ad585fc02beaacfb433d26cf0a2b9c7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake piglit' failed
Loading cache...done.
Loaded 1455 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4fda99c627dbe19f2c616eccf50658f8845c464e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4fda99c627dbe19f2c616eccf50658f8845c464e"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 261 Found 219 Missed 42 Current 519 (83% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 589 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 633 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 644 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 679 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 690 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 729 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 740 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 742 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 743 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 747 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 1082 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1108 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1121 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1129 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1152 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1157 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_fetch)
NOTE: Running task 1159 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_fetch)
NOTE: Running task 1160 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_fetch)
NOTE: Running task 1180 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1185 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 1186 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 2349f58abb81dafe4ae9077c1447075fd372b0e4ac74abe19ea510dc343dffb1. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 761 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_fetch: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1472 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_unpack)
NOTE: Running task 1473 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: Running setscene task 762 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1479 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 2349f58abb81dafe4ae9077c1447075fd372b0e4ac74abe19ea510dc343dffb1. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: Running setscene task 768 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 769 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 770 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-six-native-1.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: Running setscene task 775 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-native-1.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1508 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1528 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: Running task 1538 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe python3-six-native-1.15.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1539 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1548 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1550 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-native-1.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1552 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 1553 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1566 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-six-native-1.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 1567 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1568 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1569 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_fetch: Succeeded
NOTE: Running task 1570 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1571 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: recipe python3-six-native-1.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cython-native-0.29.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_unpack: Started
NOTE: Running task 2028 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2048 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: Running task 2052 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2053 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2080 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2081 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2142 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_configure)
NOTE: Running task 2163 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_fetch: Succeeded
NOTE: Running task 2361 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_unpack)
NOTE: recipe python3-cython-native-0.29.21-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_unpack: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cython-native-0.29.21-r0: task do_patch: Started
NOTE: Running task 2363 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_compile: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_patch: Succeeded
NOTE: Running task 2365 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cython-native-0.29.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_unpack: Succeeded
NOTE: Running task 2366 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cython-native-0.29.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2367 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe python3-cython-native-0.29.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_configure)
NOTE: Running task 2369 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_configure: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2370 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe python3-cython-native-0.29.21-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2373 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2374 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-six-native-1.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2375 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2376 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2378 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2379 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: recipe python3-six-native-1.15.0-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_populate_sysroot)
NOTE: Running task 2381 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2382 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2383 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-six-native-1.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2387 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2388 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2390 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2391 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2393 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2394 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2398 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2399 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2400 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2401 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2402 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2403 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2404 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2406 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2408 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2409 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2410 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2411 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2412 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2416 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: recipe python3-cython-native-0.29.21-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: Running task 2418 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_install: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cython_0.29.21.bb:do_populate_sysroot)
NOTE: recipe python3-cython-native-0.29.21-r0: task do_populate_sysroot: Started
NOTE: recipe python3-cython-native-0.29.21-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2420 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_configure)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_configure: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_compile)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_install)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_install: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2436 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb:do_populate_sysroot)
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-numpy-native-1.19.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2427 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2428 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2432 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2436 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2436 tasks of which 2322 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 10 ERROR messages shown, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7616377455096349212==--
