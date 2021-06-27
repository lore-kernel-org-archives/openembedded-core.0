Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5828.1624805202875017656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 13D1738C130C
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.20 FAILED
Message-ID: <MADEUP.168C77B93D8CC9AF.29174@lists.openembedded.org>
X-Groupsio-MsgNum: 153317
Content-Type: multipart/mixed; boundary="===============2515935048979051988=="

--===============2515935048979051988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdbm* to *1.20* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gdbm-upgrade-1.19-1.20.patch
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

--===============2515935048979051988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 59 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-471fff3467c32296365d984e48bc05e9293c4cc8"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:471fff3467c32296365d984e48bc05e9293c4cc8"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 5 Network 0 Missed 150 Current 598 (3% match, 80% complete)
Removing 105 stale sstate objects for arch mips32r2...done.
Removing 38 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 563 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_fetch)
NOTE: Running task 970 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_fetch: Started
NOTE: recipe gdbm-1.20-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_unpack)
NOTE: Running task 1042 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1085 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gdbm-1.20-r0: task do_unpack: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_patch)
NOTE: Running task 1199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1209 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_patch: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_patch: Succeeded
NOTE: Running task 1826 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2075 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic)
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Started
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2076 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic unihash changed to 4f8d891368ba787231b5fda5e425d8600fdff851e9c0ac448a7ef8e4ef2abba8
NOTE: recipe gdbm-1.20-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2077 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2078 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 841825cfc653d46a4b24e061c26555a5a0ddc6388490cee7a6ee60ef81e77c87
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2079 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 2081 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_configure)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2082 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_configure)
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2083 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_compile)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2086 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b78b5efb05abe13a8acf5c0eb54a13e47fc93ebb9c7c23ee3f2dc7022fb6c093
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Succeeded
NOTE: Running task 2088 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot)
NOTE: Running task 2089 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot unihash changed to e7400f54e7f2b05cbe5d1a5f632a166617cd27bc09da07e5c83a225f42a38c9c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Running setscene task 788 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Succeeded
NOTE: Running task 2110 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 2111 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2112 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata unihash changed to 37f6e898441bae6cae8fd426b3c45614f64a7a230fb3468c9566d8dbd3eaf1b6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Running setscene task 858 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 859 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 861 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 866 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2113 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 886 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 2114 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 2115 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot unihash changed to 53c0d7c8b2e7aff4de976c486945d79a8f07c4eb4b25282de62c0121d3414d10
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot became valid
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 2128 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm unihash changed to 5d6c01fe985eeb0f48cddfca37f706847fb94557faa5d4ac1346366a8abdc8f5
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 8d8dd0c50e42bb45569309ac0d955d6f03c7464046fa31a2ee47033d3a1a52a9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm became valid
NOTE: Running setscene task 978 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 979 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 981 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 982 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running task 2130 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_compile)
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Succeeded
NOTE: Running task 2132 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_install)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm unihash changed to 5443728b5638be0c783499c5f623ec0e87dfa745f4b7bcecea2b1defc42aaccd
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Succeeded
NOTE: Running task 2148 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot)
NOTE: Running task 2149 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot unihash changed to b8e79fb5cbbc0f809d91298b8409c1175ce05c56985da0ce20ad31fee5c6bad2
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.20-r0: task do_configure: Succeeded
NOTE: Running task 2150 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2151 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile)
NOTE: recipe gdbm-1.20-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Succeeded
NOTE: Running task 2152 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Started
NOTE: recipe gdbm-1.20-r0: task do_compile: Succeeded
NOTE: Running task 2153 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata unihash changed to ed5e48f8c5eb171912f6fd8e2dde4b0633e0cbb6d41aae7f37f24ba24df68980
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm unihash changed to 17b8e9b47f1c5c35a1cd60069de44163eb4129f9523e87c8fd62d67710a8e91a
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2157 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe gdbm-1.20-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2158 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot)
NOTE: Running task 2159 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_install: Succeeded
NOTE: Running task 2160 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install_ptest_base)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot unihash changed to e7ee5b61dc9e14d0302e9fbfc99bba5f7ae114a5da05705d0580de0dbefd0f29
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2161 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_sysroot)
NOTE: Running task 2162 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package)
NOTE: recipe gdbm-1.20-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2164 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2165 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2166 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to e2aa47402088fdb6efb1567674a48ae849c8611c6451852bf02fc04c8e41c4bb
NOTE: Setscene tasks completed
NOTE: Running task 2167 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2168 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_configure)
NOTE: recipe python3-3.9.5-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Succeeded
NOTE: Running task 2169 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm unihash changed to 0b06c982e057b663194fc6c8ec482271585ae935ec3de832d2d7a79addd9ab02
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Succeeded
NOTE: Running task 2170 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_write_rpm)
NOTE: Running task 2171 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_qa)
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Succeeded
NOTE: Running task 2172 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_compile)
NOTE: recipe libidn2-2.3.1-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 2173 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_install)
NOTE: recipe libidn2-2.3.1-r0: task do_install: Started
NOTE: recipe libidn2-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 2174 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 2175 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package)
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot unihash changed to 20834a7001d40c9b8ae9c99eeb992232dc4fe0efea7705f40d98073bc407f8a0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1203 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2176 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.77.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2182 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_configure)
NOTE: recipe gnutls-3.7.2-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 2183 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata unihash changed to bc275d7aca553787d621e9e8a896ed9dfb584131bb71f7e7a0a83012672b2495
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1216 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_setscene)
NOTE: Running setscene task 1217 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2184 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1223 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm unihash changed to 4732a28e43b6c7fa27abe272cda9da211f4b54aa53bc24525e7e1ab99d0c61a2
NOTE: recipe curl-7.77.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.9.5-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_configure_ptest_base)
NOTE: recipe python3-3.9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2189 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_compile)
NOTE: recipe python3-3.9.5-r0: task do_compile: Started
NOTE: recipe python3-3.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2191 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_install)
NOTE: recipe python3-3.9.5-r0: task do_install: Started
NOTE: recipe perl-5.34.0-r0: task do_configure: Succeeded
NOTE: Running task 2192 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2193 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile)
NOTE: recipe perl-5.34.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_compile)
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Started
NOTE: recipe perl-5.34.0-r0: task do_compile: Succeeded
NOTE: Running task 2195 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2196 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install)
NOTE: recipe perl-5.34.0-r0: task do_install: Started
NOTE: recipe python3-3.9.5-r0: task do_install: Succeeded
NOTE: Running task 2197 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_install_ptest_base)
NOTE: recipe python3-3.9.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2198 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_populate_sysroot)
NOTE: Running task 2199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package)
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.9.5-r0: task do_package: Started
NOTE: recipe python3-3.9.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure)
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2202 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_install)
NOTE: recipe gnutls-3.7.2-r0: task do_install: Started
NOTE: recipe gnutls-3.7.2-r0: task do_install: Succeeded
NOTE: Running task 2203 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot)
NOTE: Running task 2204 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot unihash changed to 6d905bfb7b4576edb97dd403d1e92acf8e8e1ddf4f678692e9ac2b0651c0381c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1236 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.34.0-r0: task do_install: Succeeded
NOTE: Running task 2222 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Succeeded
NOTE: Running task 2223 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata unihash changed to cf5ab0965e62ac35d67b4df6958607fcddab7d2f05ec3b1dff5a28a56940616f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata became valid
NOTE: Running setscene task 1241 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_setscene)
NOTE: Running setscene task 1242 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1247 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_setscene)
NOTE: Running setscene task 1248 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1251 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running task 2224 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1252 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
ERROR: iproute2-5.12.0-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:buildhistory_emit_pkghistory(d)
     0003:
File: '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/buildhistory.bbclass', lineno: 323, function: buildhistory_emit_pkghistory
     0319:
     0320:        write_pkghistory(pkginfo, d)
     0321:
     0322:    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
 *** 0323:    bb.build.exec_func("buildhistory_list_pkg_files", d)
     0324:}
     0325:
     0326:python buildhistory_emit_outputsigs() {
     0327:    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
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
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/5.12.0-r0/temp/run.buildhistory_list_pkg_files.23994' failed with exit code 2:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/5.12.0-r0/temp/run.buildhistory_list_pkg_files.23994: 163: cd: can't cd to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/5.12.0-r0/packages-split/iproute2-ifstat
WARNING: exit code 2 from a shell command.


ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/5.12.0-r0/temp/log.do_packagedata_setscene.23994
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe iproute2-5.12.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1253 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.5-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata)
NOTE: recipe python3-3.9.5-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1254 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm unihash changed to 99fedb63c56d46264c835b7e8bdd127141c43f74969a381934f1ddb069244632
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2231 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2233 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm)
NOTE: Running task 2234 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm)
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm unihash changed to fd1cb748574d039da183ad7263567480f9793379fc6331532d790a1b6c59bbc7
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Succeeded
NOTE: Running task 2237 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2238 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Started
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2239 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot)
NOTE: Running task 2240 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package)
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot unihash changed to 6ccc905c8cdb2fe7518266116b48bbfd7cabaee15030da00c7b4e327eb7408c3
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Succeeded
NOTE: Running task 2249 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2250 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_install)
NOTE: recipe libxml2-2.9.12-r0: task do_install: Started
NOTE: recipe libxml2-2.9.12-r0: task do_install: Succeeded
NOTE: Running task 2251 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_install_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2252 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot)
NOTE: Running task 2253 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot unihash changed to 5ce615473b036313080c74ae0c7f1793d4e8f10c0e178645d7688c7b426edb6d
NOTE: Setscene tasks completed
NOTE: Running task 2254 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2255 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure)
NOTE: recipe wayland-1.19.0-r0: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure: Succeeded
NOTE: Running task 2256 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2257 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile)
NOTE: recipe wayland-1.19.0-r0: task do_compile: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Succeeded
NOTE: Running task 2258 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata)
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2259 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2260 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2261 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2262 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to d51ed2468cdfa397bf1e35d151d6256acdf428bc9b649a639e8d6798d1742ebb
NOTE: Setscene tasks completed
NOTE: Running task 2263 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2264 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Succeeded
NOTE: Running task 2266 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2267 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata unihash changed to 34d721dbb2cd745ff3afe6fbffcdaf83bb96ddea051d25731fd7eb478fc7b292
NOTE: Setscene tasks completed
NOTE: Running task 2268 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2269 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot unihash changed to 5eb44a6b6948895d41af84387e2501a94cdc94b30e7e3d6c68664d45def9df99
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_configure: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to e4c31e67dcf2b1e89fa424e5f979e98bba4a67588240e03167fb552395cd3e34
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2275 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2276 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2277 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm)
NOTE: Running task 2278 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2279 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2280 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm)
NOTE: Running task 2281 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm)
NOTE: Running task 2282 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2283 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata unihash changed to 59ca3437acdd62951f06b9f33ef40c9bf2e3ed450afc82f43b5dd82f1bce9dc8
NOTE: Setscene tasks completed
NOTE: Running task 2284 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm unihash changed to 58eeabf22676329b128a0c88780488c0f4dbabb0af139404a1ffb94080875a7e
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm unihash changed to cfd57a673029475317e7f96ce3f562c6065fc3f031001131d893a60b44ef5c21
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm unihash changed to cd24c2737385f58deedc1745c64fe09c576b8332a63c29b3c8714794b2e9365e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to ead92e4650442f50a2ef90682d776f6efdab035e89a07e253189f7aa4f2a122a
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 1507e5165915308756952598cd6d5d61b09a3a0bb789466ed1d0f7a1973939f8
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2287 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm unihash changed to f5f85e995a6aa0973b429d24059f5638ddbe9ff08d3e3a8754d26df5442de5ad
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to d6708161dac9a2bb43bf6bcbcfd353f64cf0b5ee8dd52cb9fbbbfda49081ce8c
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm unihash changed to 3f7c2a6b5cf2173dfc22973abc3f666a8205a7d4f99d2969b48b28a3b820d8e8
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm unihash changed to 56e13b19663a3197a27eed68871e57ddd905f3c18f4629ecd95b60450cb7cd0e
NOTE: recipe systemd-1_248.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_compile)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm unihash changed to 3c83ac48635c0a70473d3e1df1b56bb0524cb130a39edec3086cf0f2e672322a
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm unihash changed to 1aea1cba5b65ea95ce0fc9230ab6ba41fa8760b132de5d5c3c2e693b66549006
NOTE: recipe systemd-1_248.3-r0: task do_compile: Succeeded
NOTE: Running task 2289 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_install)
NOTE: recipe systemd-1_248.3-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot)
NOTE: Running task 2291 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2292 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2293 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2294 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: Running task 2297 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Succeeded
NOTE: Running task 2298 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata unihash changed to 9309eec8a9ca3f1b054bc499d35b8dfcad98028172f02a7e480c4c6d11eef8ce
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1546 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Running task 2302 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata unihash changed to 9c39ea540fb1ca0feb62eadc701767a0b5c4da93abca418df093c78b7d98333b
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm unihash changed to e1d8ffad942418c5b43b3c73c81422a9be2ceba062b1f05aa30263ccbec549d4
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 0fde5e68922eb63c47b61a2b80a9de16a4c5a4116a32e3c95776af9f8dd8e292
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1579 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm)
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm unihash changed to 8a7e066ce09ac0bca85b376159bf6c0c9b0c4f80b4ebf42ad685523151d12bb2
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm unihash changed to 67484896b4bc3418eeacf8287ecf9937489e59695d7f6251bec233f614d2dc12
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 04fb21ead0a02e687cfb4eb3ab8394d8abeeb939c9c3ab51c247f5a1c0e60b4f
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm unihash changed to 1fb8ff3dd7759b101a2e912e3eb8b1908f14a2ea889a8670caac25ee7831e13d
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2320 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2321 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile: Succeeded
NOTE: Running task 2322 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2323 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install: Succeeded
NOTE: Running task 2324 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2325 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot)
NOTE: Running task 2326 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to 68f98415c9a09247b7fe7a29610498b0b695bf90f047ee3a6079811566d6a721
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 6cace442007042f8172eb4aade7c35a875df1841947e2607eaec448e24a0e8ef
NOTE: Setscene tasks completed
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to dc41ac478c441b26586b761b21d0a95eff795a48ea21e8815a05258a48144bf2
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot unihash changed to d5a7484c9c393b11833345626d61412fbe732dc0e08d5f3ea4d98afae0335e3c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1648 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1650 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to 32c22745e6c2b7df765dd8a059ed9411190f7de4cbacbd0d119dfd9540a99c0b
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to b6196dd28a7522634a7e4b6c2035cc16284e3c8f6f202dc2491b327a1ada7775
NOTE: Setscene tasks completed
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to e824ae8b7158bcc8085901b88da817b5917873513ccf6c296307e1ce0e37e4bb
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 59ce997a3a37a2de8618af4b6b3c238e13bf689154c07a31c2b10ce915f4558d
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm unihash changed to f0624d0329f05e26a04ef4b775b396a967247890e31c712e8e834f2fe5bb2df2
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2373 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2374 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install)
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2375 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_install_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2376 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package)
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Started
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2379 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 878196f687de85c44ceceefeefbc87eede69f1e5f15959de38fd16b755df1e49
NOTE: Setscene tasks completed
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to 6bcd5e392fcb07c941f475f7ee919b12d674bea6543f48eb555523f311334718
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to e6dfd635b46b635c759f609cc6ccc8b71be5035d74daa3540b907138c5b4fd8b
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to 9d936fa9fcb8f9f412b2759f3771470e2f8ecae16d9f6487ab46e2cbe7a7b0b7
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to 620401a461275d120c204c795e21346dbc85abf68c378d3969debfc6ef0b0855
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Running setscene task 1665 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1668 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2388 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to 833c217f4f8e72dcb0ecbd0eb8f97b7d5e9acd55c769be5cef1b26a607a035df
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to 6a2b574ae8a2b1b323523d74ae79bb8932655b9e1f0c6f16efeacdef96cc177a
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2174 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============2515935048979051988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)

--===============2515935048979051988==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.19-1.20.patch"

From 0dc69a50e483c420bddb4162d91b860e24dc9e2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 27 Jun 2021 14:34:42 +0000
Subject: [PATCH] gdbm: upgrade 1.19 -> 1.20

---
 meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.19.bb => gdbm_1.20.bb} (90%)

diff --git a/meta/recipes-support/gdbm/gdbm_1.19.bb b/meta/recipes-support/gdbm/gdbm_1.20.bb
similarity index 90%
rename from meta/recipes-support/gdbm/gdbm_1.19.bb
rename to meta/recipes-support/gdbm/gdbm_1.20.bb
index cd2617b130..51f9d17e49 100644
--- a/meta/recipes-support/gdbm/gdbm_1.19.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.20.bb
@@ -13,8 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[md5sum] = "aeb29c6a90350a4c959cd1df38cd0a7e"
-SRC_URI[sha256sum] = "37ed12214122b972e18a0d94995039e57748191939ef74115b1d41d8811364bc"
+SRC_URI[sha256sum] = "3aeac05648b3482a10a2da986b9f3a380a29ad650be80b9817a435fb8114a292"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.17.1


--===============2515935048979051988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-bin: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-compat: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 801880 to 859532 (+7%)
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 14270 to 14680 (+3%)
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-doc: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 179576 to 187167 (+4%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 14387 to 14022 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 16763 to 18206 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 16039 to 17436 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 14847 to 14486 (-2%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 12299 to 11953 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 17153 to 18703 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 6164 to 5762 (-7%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 16737 to 18088 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 16594 to 18079 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 21254 to 22974 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 21057 to 22827 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 16096 to 17439 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 21800 to 23644 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 18101 to 17383 (-4%)
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 325415 to 325414 (-0%)
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-src: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 397009 to 419951 (+6%)
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)
packages/core2-32-poky-linux/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz file://run-ptest file://ptest.patch"
packages/core2-32-poky-linux/perl/perl-dbg: PKGSIZE changed from 16787764 to 16789892 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 15030520 to 15031668 (+0%)

--===============2515935048979051988==--
