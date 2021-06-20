Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.32332.1624189110530045588
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id B25F738C12B7
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.20 FAILED
Message-ID: <MADEUP.168A47641EA9D178.8577@lists.openembedded.org>
X-Groupsio-MsgNum: 153113
Content-Type: multipart/mixed; boundary="===============1515117118494254211=="

--===============1515117118494254211==
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

--===============1515117118494254211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-98558cc859c90429429b0ff1cca1f0dd81940050"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:98558cc859c90429429b0ff1cca1f0dd81940050"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 157 Local 7 Network 0 Missed 150 Current 596 (4% match, 80% complete)
Removing 38 stale sstate objects for arch qemuarm...done.
Removing 105 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 563 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_fetch)
NOTE: Running task 970 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_fetch: Started
NOTE: Running task 1086 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_fetch: Succeeded
NOTE: Running task 1125 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1126 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_unpack)
NOTE: Running task 1127 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1196 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1208 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_unpack: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_patch)
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_patch: Started
NOTE: recipe gdbm-1.20-r0: task do_patch: Succeeded
NOTE: Running task 2074 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_deploy_source_date_epoch)
NOTE: Running task 2075 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic unihash changed to 65d312f91bf654b4d575370d37ab7abc0938f4158b57a4827815b7272350db3d
NOTE: Running task 2076 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_configure)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2078 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2079 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: Running task 2082 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2083 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 278761f683d58654f46eeb60975397bcf0fc79ad68c8c25e0ee17d6d6bbad66b
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Succeeded
NOTE: Running task 2084 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_compile)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_compile: Succeeded
NOTE: Running task 2085 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2086 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1fadc44bbb97006d7f8b62466dc5b890540a7ca4ef72a6e997187e3c55717d9e
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Succeeded
NOTE: Running task 2088 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot)
NOTE: Running task 2089 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot unihash changed to 96b6f487b9462e06cf48fd6f195625bcb7cc63a21e1cd1a4be4b0f4197c4d574
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Running setscene task 789 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 2110 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata unihash changed to 14e2834ae5505ca994d6b3a9d21ec92ba8d23de7f54842c67711de5f6cf7c660
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Running setscene task 855 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_setscene)
NOTE: Running setscene task 856 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 857 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 859 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 860 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 863 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2113 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 885 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 886 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 887 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 2114 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 2115 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot unihash changed to ba6fc5befc072ebb3d4973d21680a7b90e9440570192385c86c769392a5a6764
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot became valid
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Succeeded
NOTE: Running task 2119 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_compile)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm unihash changed to 4738894db8837952b4faffe07d39ae7c11c6c8f43ae0db5e1c682e1daa2179aa
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 2120 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Succeeded
NOTE: Running task 2131 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_install)
NOTE: recipe libice-1_1.0.10-r0: task do_package_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 0f9972dae0625e9619dc969d44b23f5007b4ac5ec75b51d5cdac9e71d91312a0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Running setscene task 975 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 976 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 977 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running task 2138 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 996 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm unihash changed to 16ec4717d8afaead47d24165f1fdfda49edeeea35651d6d763b034f5e1591d34
NOTE: recipe gdbm-1.20-r0: task do_configure: Succeeded
NOTE: Running task 2142 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure_ptest_base)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2143 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.20-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot)
NOTE: Running task 2145 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_compile: Succeeded
NOTE: Running task 2146 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot unihash changed to b67fcb550ed3a1ed67efa492dfab4a3bfcdffe00efb81b3ae8577a2a21e9b094
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Succeeded
NOTE: Running task 2153 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata unihash changed to b7d7684933118f6439a5bf2121b1c892bc9638c9fe7a8717c7f58abb0b356f49
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2155 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install)
NOTE: recipe gdbm-1.20-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2156 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: recipe gdbm-1.20-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install_ptest_base)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2158 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_sysroot)
NOTE: Running task 2159 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package)
NOTE: recipe gdbm-1.20-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2160 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2161 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm unihash changed to 33d942a681850a6c391e24ec20ef84c77bacf437dfca93a9a4eb3c4120666bd5
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe python3-3.9.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: Running task 2163 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2164 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot)
NOTE: Running task 2165 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Succeeded
NOTE: Running task 2166 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot unihash changed to ca7ad8c8ebc6e3434e57bc516701890e86e2f81926b71a6f579be8818cc2fbce
NOTE: Setscene tasks completed
NOTE: recipe python3-3.9.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2167 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_configure)
NOTE: recipe python3-3.9.5-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Succeeded
NOTE: Running task 2168 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_write_rpm)
NOTE: Running task 2169 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package_qa)
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2170 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to 464a5d90dcde5160368ebea7bfee4ceff643eca530546c97ea736ddc06105a7d
NOTE: Setscene tasks completed
NOTE: Running task 2171 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_package_qa: Succeeded
NOTE: recipe gdbm-1.20-r0: task do_package_write_rpm: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm unihash changed to 944e1b110bea3773094695e432bfd6b8b829cd090b774c99accfda07be0eecb1
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot unihash changed to c4eaa010d858fbb87184b2955f1f0d744b3a67151b2e9a9fcb9f8c214c86ea85
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1202 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_populate_sysroot_setscene)
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata unihash changed to 2d6b0cd2a9a00d2b8ac37170ab309d8951ef033592cadbbca04f867439e9c5b2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata became valid
NOTE: Running setscene task 1216 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2184 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1222 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm unihash changed to dcbe89443e1e65aa0ebf2e56d5ee32f5113a881828e0c7b2f876faece44a564e
NOTE: recipe python3-3.9.5-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_configure_ptest_base)
NOTE: recipe python3-3.9.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2189 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_compile)
NOTE: recipe python3-3.9.5-r0: task do_compile: Started
NOTE: recipe perl-5.34.0-r0: task do_configure: Succeeded
NOTE: Running task 2190 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2191 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile)
NOTE: recipe perl-5.34.0-r0: task do_compile: Started
NOTE: recipe python3-3.9.5-r0: task do_compile: Succeeded
NOTE: Running task 2192 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2193 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_install)
NOTE: recipe python3-3.9.5-r0: task do_install: Started
NOTE: recipe gnutls-3.7.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_compile)
NOTE: recipe perl-5.34.0-r0: task do_compile: Succeeded
NOTE: Running task 2195 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Started
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot unihash changed to c67e747bf1000ff0907e12f3f189d5360399fa77e0e9d51a3dd71a087c7bb34b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1236 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Succeeded
NOTE: Running task 2222 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2223 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Succeeded
NOTE: Running task 2224 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.5-r0: task do_package: Succeeded
NOTE: Running task 2225 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_packagedata)
NOTE: recipe python3-3.9.5-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata unihash changed to e03e008ba2dc97750a9ca4353425363b6acbbec11eb64d0bb9a905a30358d9d4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1241 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_setscene)
NOTE: Running setscene task 1242 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1245 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_setscene)
NOTE: Running setscene task 1246 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1251 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running task 2226 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1252 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2227 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.5.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2228 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.5-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1253 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm unihash changed to 24ee21f267983d8ceaeb391b271109503b0d8ab1da223c3180b146b6e6151e67
ERROR: elfutils-0.185-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

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
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/elfutils/0.185-r0/temp/run.buildhistory_list_pkg_files.29269' failed with exit code 2:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/elfutils/0.185-r0/temp/run.buildhistory_list_pkg_files.29269: 195: cd: can't cd to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/elfutils/0.185-r0/packages-split/libasm
WARNING: exit code 2 from a shell command.


ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/elfutils/0.185-r0/temp/log.do_packagedata_setscene.29269
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe elfutils-0.185-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1254 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2232 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata)
NOTE: recipe perl-5.34.0-r0: task do_install: Succeeded
NOTE: Running task 2234 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.185-r0: task do_packagedata: Started
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm unihash changed to 63c159f1b0749dd88b0105804a407aa86661194388a70d3d67b6e230da05b09a
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2240 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package)
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot unihash changed to c318439d5fe40cfe0f3b3b1dff784b103966108815ebe23803c28f36916259fd
NOTE: Setscene tasks completed
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot unihash changed to 3103d6f2f75568ded493e048a3166e4dcd260cebeccc48a9b401a12666ae27a4
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
NOTE: recipe wayland-1.19.0-r0: task do_compile: Succeeded
NOTE: Running task 2258 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2259 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_install: Started
NOTE: recipe wayland-1.19.0-r0: task do_install: Succeeded
NOTE: Running task 2260 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.19.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2261 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to 11e21db574e1b5bb507c43eecf5a8a34535e42bd16c8a19b2cf3058f74bc4233
NOTE: Setscene tasks completed
NOTE: Running task 2262 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2263 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Succeeded
NOTE: Running task 2264 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata)
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Succeeded
NOTE: Running task 2265 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2266 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata unihash changed to d0b4eb1e7472c03a20bab58f94c6cfd4055c2103f1880c36e0c77e12d5d5e026
NOTE: Setscene tasks completed
NOTE: Running task 2267 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2268 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2269 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_install)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2270 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot unihash changed to 5f85a9ef640b9e7329f37cf470557d4b1558faea89afe90b187c075af9704798
NOTE: Setscene tasks completed
NOTE: Running task 2271 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 6e13952de6c6fa630261779e3a774a4a6b6af9779c02815fbee43c7961a78518
NOTE: Setscene tasks completed
NOTE: Running task 2273 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Started
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2274 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2275 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata unihash changed to bc89af6a987b607869713dd224d4700c878c38952d4216a86fa752341c0217f4
NOTE: Setscene tasks completed
NOTE: Running task 2276 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2277 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2278 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2279 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm)
NOTE: Running task 2280 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2281 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2282 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm)
NOTE: Running task 2283 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm)
NOTE: Running task 2284 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm unihash changed to 35f262d8296c47f3ec895a270e364644493a71afa8b511afb8be462e74123eae
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm unihash changed to 1b1fa7030dbbdfdf754d3415bc3008d2d2267ffabc703597e1feec88cec22bed
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 4e12cc3ba34da760a24cb7cd64325b9c201a23c6ee2c3eea9d1971a295654e2d
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm unihash changed to 753764275770d4f68939b8b0b05abd77926660dd1bbc4964da7593aa14a37564
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2285 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to cac55356f923c13c83aa3c1d2ff16beb10146d22cc04939227112020c7e8156a
NOTE: Setscene tasks completed
NOTE: Running task 2286 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2287 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm unihash changed to 99d0e88c3095e5407f28516cf61c53813b604b5c8e9880892a4ae964b6de8e3c
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 2ee0156bc7d2fc63f9892dcadfc16e99baf9e12b124a3df1cf910500b7d65d39
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm unihash changed to c8188e35de628853c0692e5b1f39eaddc51bd9ceb91067817f8cf763b03fd6db
NOTE: recipe bash-5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm unihash changed to 083e7b4f8b9d448817a1f0f90ab26c4288d9b2335c4341aecc18220aa7d71996
NOTE: recipe systemd-1_248.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2288 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_compile)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Started
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
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm unihash changed to b783fa60c7342d1b16ac08ed91cfb63fd6a1bdc6e6a5e94630bd3d7ab83c36f3
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Succeeded
NOTE: Running task 2299 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata unihash changed to e4708380883b89e56bb07d74991d98e8c1dd8e6e9c3baac58d50b94735b89d3a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1548 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2302 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata unihash changed to 4ca1abfcfd96772bea9a0751b773bd526eeb06433cb9afd5aa7fdb1f8ffda782
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm unihash changed to fc832f297d1c7a95ced5692aeee22281723912f8d3d9d73b200661c63f9959e5
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm unihash changed to 01b778d943674bccf022ce5f4ae8ff59e44a91ab15c8b89c39c57b178744bd3e
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 28fd7bf1a7a185ea65b56bb041dd840db1f91c111698bc4be45ae7601002c7c4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1580 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm unihash changed to b837e1b8af22cbadb481d912d9c8ef91cf320ddd833cb4a85957f4e842f97801
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm unihash changed to 7588aa1273f27a07c193c04dab7af382850a3e25ae2a4a1fbd3a2478c903a3ea
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to 23c7bec290e9b16e1dd248c729c4b7ef7183da1090e34bf0c3feab4bfbb3b200
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm unihash changed to 0c547ab1e2955c22c843696a0edd1b3df4bdbbdc9fad860389d3d33a799878f0
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to e9077ea17dfe2a003c0035af1be00437303102ddcb9593a4fe4acf545208a0cf
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 8f8eb7dfd8cc15d5e5e0c2d21a10ec14b084697e37a065f54d365f30af4a2755
NOTE: Setscene tasks completed
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to 2aa51811e2cd70a6f12bd269b7a5e878eb387d712d6a75056cbf8caaa07e5fc7
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot unihash changed to a9693cfa3d90e011cfe549086f5f797a176141bcd6b560a16e0fa3d068aa09ac
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1650 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1651 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2364 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to cb780250cb0bb095dc36c2a1efe4b9bf1cf18050f6ccd02137bd29806222f111
NOTE: Setscene tasks completed
NOTE: Running task 2365 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to a53a1b98d2f0b90c69bcc50145bcb8aedf9ee23a089100c488dfafc8e0f3bd8e
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to c38d828afcf60673e8a824fce754297a845830404893991ad51acd1e69748797
NOTE: Setscene tasks completed
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 09ed601d62d3e8cbbc095fad5078197aac1518daa896054acdc705b3a925561e
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
NOTE: recipe dbus-test-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2377 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 8de5c7c6ce5ec7a872b5f57fb6a8ff2c6a7ddc4c7e468dbc434ccb3b54cd3e87
NOTE: Setscene tasks completed
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2379 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to b7ebfe29af6a3c31dd5259bcb506e13ffebaad5502a7ef743b88115cc68c0bf2
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to 9559e850bba6e8ceee364071732fcbe3fef6855b647f867ac7fb9d89757d905a
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm unihash changed to e68543a64ac82e5e39c9dd7f946825b05509571686ffc2bf26f1209e3d6c139c
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to e38c24d17708e2a860bc448a1f46d2ed9b4cce5db0d80a722f0f41e38b875d4a
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to c41aeecd0b20c986dd5d7c2ab83eaa58e716bc0520318d33367d24506e6edc72
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Running setscene task 1666 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1669 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2388 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to ed268e8ab2c614b5e117602f0022a05436689c98d28e6dc3b2b23d42fc33fe77
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to 7848325337fe826900395229dd1742d6c5fdbfd977449caa84193f588299800f
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2174 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============1515117118494254211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdbm/gdbm-bin: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-compat: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 801880 to 859532 (+7%)
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 14270 to 14680 (+3%)
packages/core2-32-poky-linux/gdbm/gdbm-dev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 179576 to 187167 (+4%)
packages/core2-32-poky-linux/gdbm/gdbm-doc: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 14387 to 14022 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 16763 to 18206 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 16039 to 17436 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 14847 to 14486 (-2%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 12299 to 11953 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 17153 to 18703 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 6164 to 5762 (-7%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 16737 to 18088 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 16594 to 18079 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 21254 to 22974 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 21057 to 22827 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 16096 to 17439 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 21800 to 23644 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 18101 to 17383 (-4%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 325415 to 325414 (-0%)
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 397009 to 419951 (+6%)
packages/core2-32-poky-linux/gdbm/gdbm-src: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)
packages/core2-32-poky-linux/gdbm/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz file://run-ptest file://ptest.patch"
packages/core2-32-poky-linux/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/perl/perl-dbg: PKGSIZE changed from 16787764 to 16789892 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 15030520 to 15031668 (+0%)

--===============1515117118494254211==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.19-1.20.patch"

From 3add870a0bc2aa940511e8e14a641e27358750a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 10:18:35 +0000
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
2.20.1


--===============1515117118494254211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)

--===============1515117118494254211==--
