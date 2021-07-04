Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.7505.1625391858827739480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id DFC0638C1288
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdbm: upgrading to 1.20 FAILED
Message-ID: <MADEUP.168E8D48B8DEB527.9961@lists.openembedded.org>
X-Groupsio-MsgNum: 153537
Content-Type: multipart/mixed; boundary="===============8325584886356132040=="

--===============8325584886356132040==
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

--===============8325584886356132040==
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
DISTRO_VERSION       = "3.3+snapshot-ff15e69929f9a2cade90c476756bd81156ffac22"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ff15e69929f9a2cade90c476756bd81156ffac22"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 157 Local 7 Network 0 Missed 150 Current 596 (4% match, 80% complete)
Removing 38 stale sstate objects for arch qemuarm...done.
Removing 105 stale sstate objects for arch armv7vet2hf-neon...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 563 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_fetch)
NOTE: Running task 970 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_fetch: Started
NOTE: recipe gdbm-1.20-r0: task do_fetch: Succeeded
NOTE: Running task 1042 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_unpack)
NOTE: Running task 1043 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1085 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_unpack: Started
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_patch)
NOTE: recipe gdbm-1.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1209 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.20-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_patch: Succeeded
NOTE: Running task 1654 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1997 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 2076 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2077 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2078 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_lic unihash changed to 673c8d4979d82e60932bb0b2d09bc84eaaa7447ace02394e1e610069c8f9bd76
NOTE: recipe libidn2-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2079 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_configure)
NOTE: recipe gdbm-1.20-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2080 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_configure)
NOTE: Running task 2081 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_configure)
NOTE: recipe libidn2-2.3.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2082 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2083 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3ac43696b851485adafba19a643f135a128833e98a29f0334cd75440e1a4e9
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b169c09b3341afe1cc48221181569c738481714a299e3f58e326f2a67a108e3b
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_install: Succeeded
NOTE: Running task 2088 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot)
NOTE: Running task 2089 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot unihash changed to 0711bd794f6e4f4e9d98b0293eb818335e2ecbb9d05b0b440a5636fbea649cb9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot became valid
NOTE: Running setscene task 792 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 2100 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 2111 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package: Succeeded
NOTE: Running task 2112 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata unihash changed to 6a1deddf541bb426133861abb0387bebb8ce2a38ac796de8896c0ed420838305
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package became valid
NOTE: Running setscene task 857 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 858 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 860 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_setscene)
NOTE: Running setscene task 861 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 864 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_setscene)
NOTE: Running setscene task 865 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2113 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Started
NOTE: Running task 2114 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 2115 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 885 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 887 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot unihash changed to 251717016a2d550e39e991349451048483e08bc27b2aa995cc901126f3d67eb0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot became valid
NOTE: Running setscene task 944 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running task 2128 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm unihash changed to abca364150909e5fe805b1354c4e3427369e8dc7ee5216abc94daa07f7cf1f68
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_configure: Succeeded
NOTE: Running task 2129 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_compile)
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_compile: Succeeded
NOTE: Running task 2140 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata unihash changed to 03b6ecbda3d54ae7009684c590895a48e8cf39f22d4418e41b6a0d699c04c8bc
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata became valid
NOTE: Running setscene task 977 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 978 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_setscene)
NOTE: Running setscene task 979 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running task 2141 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 996 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm unihash changed to 7951e550945eddadeb9983d278e1c56cf57f301e581e7f6cca8dea24e27ae67d
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
ERROR: libxcb-1.14-r0 do_packagedata_setscene: Error executing a python function in exec_python_func() autogenerated:

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
Exception: bb.process.ExecutionError: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.30360' failed with exit code 2:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/run.buildhistory_list_pkg_files.30360: 195: cd: can't cd to /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/packages-split/libxcb-locale
WARNING: exit code 2 from a shell command.


ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/libxcb/1.14-r0/temp/log.do_packagedata_setscene.30360
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Failed
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxcb-1.14-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2143 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata)
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_install: Succeeded
NOTE: Running task 2144 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot)
NOTE: Running task 2145 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package)
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot unihash changed to 7001fc240998f0cd1f3437b136a3138f9b5a678dd8374b7ebaeef14aae4cb04e
NOTE: Setscene tasks completed
NOTE: recipe libxcb-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata unihash changed to 94b80826d55e8660b56b63deb571cc3984cb5767848e155323f4c9d531dc4b26
NOTE: Setscene tasks completed
NOTE: Running task 2151 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_configure: Succeeded
NOTE: Running task 2152 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2153 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile)
NOTE: recipe gdbm-1.20-r0: task do_compile: Started
NOTE: recipe gdbm-1.20-r0: task do_compile: Succeeded
NOTE: Running task 2154 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm unihash changed to bc19515eac7de4f5881e308ed747c7f7cc7ed8aa5e794cd10d12c60c2622c301
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot)
NOTE: Running task 2158 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot unihash changed to 9a4ec2338824cbaf359b09cb2668bbd23906af4dc43fd533156ef3a86502c832
NOTE: Setscene tasks completed
NOTE: recipe gdbm-1.20-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2159 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install)
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 2160 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata unihash changed to 4f8a45305b318e11a27d6ef03aeba248fb5094ef413fd259b4ec434d290298b3
NOTE: Setscene tasks completed
NOTE: Running task 2161 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm)
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.20-r0: task do_install: Succeeded
NOTE: Running task 2162 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Started
NOTE: recipe gdbm-1.20-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2163 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_populate_sysroot)
NOTE: Running task 2164 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_package)
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Started
NOTE: recipe gdbm-1.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2165 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2166 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm unihash changed to 850527bf376765dac911001c8350161c5977a0bd72a34d07729db7ddda3a4289
NOTE: recipe perl-5.34.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2167 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_configure)
NOTE: recipe perl-5.34.0-r0: task do_configure: Started
NOTE: recipe python3-3.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2168 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_configure)
NOTE: recipe python3-3.9.6-r0: task do_configure: Started
NOTE: recipe gdbm-1.20-r0: task do_package: Succeeded
NOTE: Running task 2169 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_packagedata)
NOTE: recipe gdbm-1.20-r0: task do_packagedata: Started
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
NOTE: recipe libidn2-2.3.1-r0: task do_package: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_populate_sysroot unihash changed to 52d09dd251c37a616df91f6c083f3fbbdaaa815ae7e462048a63d6e9e5c51352
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata unihash changed to 9bbbd20d1d80b7472639a773b7546db6dacb63980713a7e3ec47191dc2a596e5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1216 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_setscene)
NOTE: Running setscene task 1217 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: Running task 2184 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1223 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm unihash changed to 6c0a4c9ed81a25b2356b3e204c874df2879bea24388b12cc6d1ef765f8289698
NOTE: recipe python3-3.9.6-r0: task do_configure: Succeeded
NOTE: Running task 2188 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_configure_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2189 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_compile)
NOTE: recipe python3-3.9.6-r0: task do_compile: Started
NOTE: recipe python3-3.9.6-r0: task do_compile: Succeeded
NOTE: Running task 2190 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_compile_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2191 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_install)
NOTE: recipe python3-3.9.6-r0: task do_install: Started
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
NOTE: recipe python3-3.9.6-r0: task do_install: Succeeded
NOTE: Running task 2197 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_install_ptest_base)
NOTE: recipe python3-3.9.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-3.9.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2198 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot)
NOTE: Running task 2199 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package)
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.9.6-r0: task do_package: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2200 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2201 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure)
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure: Succeeded
NOTE: Running task 2202 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2203 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile)
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.2-r0: task do_compile: Succeeded
NOTE: Running task 2204 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_install)
NOTE: recipe gnutls-3.7.2-r0: task do_install: Started
NOTE: recipe python3-3.9.6-r0: task do_package: Succeeded
NOTE: Running task 2205 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata)
NOTE: recipe python3-3.9.6-r0: task do_packagedata: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2206 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm)
NOTE: Running task 2207 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm unihash changed to 701a4286561df6a1223e1016baf9b19f26641781c043fb1aab8f1128c386aa98
NOTE: recipe gnutls-3.7.2-r0: task do_install: Succeeded
NOTE: Running task 2208 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot)
NOTE: Running task 2209 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package)
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Started
NOTE: recipe gnutls-3.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_populate_sysroot unihash changed to e354b6f1a4b00e5bb26a9d07f9bcd139d11fc080ba1af9383aa05a270248f7a0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1234 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.9.12-r0: task do_compile: Succeeded
NOTE: Running task 2227 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_compile_ptest_base)
NOTE: recipe libxml2-2.9.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package: Succeeded
NOTE: Running task 2228 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata unihash changed to 7a11cf4b2a04f89837c93848c646b33fed2268a31bd201a6f38340b415808f17
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata became valid
NOTE: Running setscene task 1241 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1242 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1246 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1247 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running setscene task 1251 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_setscene)
NOTE: Running setscene task 1252 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running task 2229 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_install: Succeeded
NOTE: Running task 2230 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_install_ptest_base)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm unihash changed to 50beaf2963e54fb043c57720eac8547f9bcc39507f834241197c4e503859f056
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2240 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot)
NOTE: Running task 2241 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package)
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Started
NOTE: recipe perl-5.34.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_populate_sysroot unihash changed to 84906aaa5e018d3cc128281d427ec03c84c05e57de8d48a632b4ffeb32e0fad8
NOTE: Setscene tasks completed
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot unihash changed to 86ec560063216c623df5136be78233dc22431237fbcf786252556ed64c8a568b
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot unihash changed to 6c33215c7124ca579e579e92ea08a0403a0a8e394b7998a3543d471736dbe5c8
NOTE: Setscene tasks completed
NOTE: Running task 2262 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2263 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2264 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2265 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_install)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_install: Succeeded
NOTE: Running task 2266 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot unihash changed to 9230ef728133b1f39c504542467985703de3eca49766c6ba960cc836144b2106
NOTE: Setscene tasks completed
NOTE: Running task 2267 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2268 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_configure)
NOTE: recipe systemd-1_248.3-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package: Succeeded
NOTE: Running task 2269 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata unihash changed to 1b5ff586d673b30d13fa177da6b0a481047d32b807105c001c7ea78bcbb68d12
NOTE: Setscene tasks completed
NOTE: Running task 2270 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package)
NOTE: Running task 2271 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package: Succeeded
NOTE: Running task 2272 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata)
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata unihash changed to 4c2742b907b9e6a5ff8beb88df12362688a58c5d1fb4f079c57934fa5b076f68
NOTE: Setscene tasks completed
NOTE: Running task 2273 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package: Succeeded
NOTE: Running task 2274 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata unihash changed to c151bc9eb6eaed42b5806e381f3c4811ac740d99067af0e9e84cf99bfa5daf53
NOTE: Setscene tasks completed
NOTE: Running task 2275 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.0-r0: task do_package: Succeeded
NOTE: Running task 2276 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata)
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm unihash changed to 0bb9ce24c5ee195dfcba04856d7246117a0b88605a6f89812d82fa587bb47896
NOTE: recipe systemd-1_248.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2277 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_compile)
NOTE: recipe systemd-1_248.3-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm unihash changed to 2d8d1f67088b00aac4dbfd72c28455b48e2125e8e58c3595c03df8e9253fdd42
NOTE: recipe systemd-1_248.3-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_install)
NOTE: recipe systemd-1_248.3-r0: task do_install: Started
NOTE: recipe perl-5.34.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2279 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: Running task 2280 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2281 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm)
NOTE: Running task 2282 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm)
NOTE: Running task 2283 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm)
NOTE: Running task 2284 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm)
NOTE: Running task 2285 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm)
NOTE: Running task 2286 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm)
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_248.3-r0: task do_install: Succeeded
NOTE: Running task 2287 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot)
NOTE: Running task 2288 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2289 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2290 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2291 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm unihash changed to 5c3e40e5041c04468748314db4052b4764b78301a16af9ddefcd5d762da570a8
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata unihash changed to 8a04af7125a3a52385ceb39c5207d2a9e14b417917ff98b1f6283b98bc442574
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to e4f4ffe208fe9f6c4ed180a5275bd2445773011a9545d14a0d3be7a516f335da
NOTE: Setscene tasks completed
NOTE: Running task 2293 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm)
NOTE: Running task 2294 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2295 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_configure)
NOTE: recipe dbus-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2296 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_configure)
NOTE: recipe procps-3.3.17-r0: task do_configure: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_configure: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm unihash changed to 23621a01e9833a90fa5b873a5affcec11465c08a098137fc8fc8a1b507c374db
NOTE: recipe sed-4.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm unihash changed to 3803683bc9830a4d5c16018c5fe57afac0207e965264f10ec7d54866f291618d
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm unihash changed to de1ba84f45f6c54debd39901b4fdbef7075537604241c2c74fc60f80686a556b
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm unihash changed to e5c58091693a1bf6c8e855c2444059bc71f13666a8be4f71ab7eebcbe4cb7451
NOTE: recipe btrfs-tools-5.12.1-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_compile)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_compile: Succeeded
NOTE: Running task 2299 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_install)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Started
NOTE: recipe systemd-1_248.3-r0: task do_package: Succeeded
NOTE: Running task 2300 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata unihash changed to 946ff309ed075db23c33aa3d7c4b9b3c920db222127b896de0cdf4e5634cfff9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1548 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running task 2301 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package)
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata unihash changed to 43172780f3306c62e3b02fdc8e02876987557c67bb6c6c53cf79cb4486055c3f
NOTE: Setscene tasks completed
NOTE: Running task 2304 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2305 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_compile)
NOTE: recipe procps-3.3.17-r0: task do_compile: Started
NOTE: recipe procps-3.3.17-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_install)
NOTE: recipe procps-3.3.17-r0: task do_install: Started
NOTE: recipe procps-3.3.17-r0: task do_install: Succeeded
NOTE: Running task 2307 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package)
NOTE: recipe procps-3.3.17-r0: task do_package: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm unihash changed to fcde20a71d4c2114cbb3d62e37310f18a00746925febe6d32285279da901e4c1
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm unihash changed to b6ad36add15ad9dee27f26dbab0ffb7db854435da273859e7ab8f2652352a3de
NOTE: recipe procps-3.3.17-r0: task do_package: Succeeded
NOTE: Running task 2308 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata)
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata unihash changed to 10a1ce795d4c7cec3a71fb6ac1d0e21008a4d36ec468c13909f3be1659aad3ee
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1578 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running task 2309 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm)
NOTE: Running task 2310 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm unihash changed to f07c89944dfef8bb0ff30232900653de7b6dff06057ae38a748eef95dfe39117
NOTE: recipe dbus-1.12.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe dbus-1.12.20-r0: task do_compile: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm unihash changed to 08cad0bd949e9234d8da62b1891c0ece036bb4f1125ae0fb3e7ede2e3021a008
NOTE: recipe dbus-1.12.20-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: recipe dbus-1.12.20-r0: task do_install: Started
NOTE: recipe dbus-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 2314 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: Running task 2315 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2316 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2317 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_configure: Started
NOTE: recipe dbus-1.12.20-r0: task do_package: Succeeded
NOTE: Running task 2318 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm unihash changed to 58274266104737ced38370a76667439cd62127064c1f25d326a1532e4c45e463
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata unihash changed to c549f302ab0ba8f1f35cfe7cf4717744457d30bc5827bbdf027728896073d9af
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm)
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm unihash changed to e26ec8e84f41a0bc53502ce5c01f5f6577ca9423df5ce385199640286d237432
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot unihash changed to b2b12bf58144fb0d8bd1a730ba7c125fe77bfdfedae92bff632533b87d07d3a6
NOTE: Setscene tasks completed
NOTE: Running task 2327 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2328 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2329 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2330 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2331 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_configure)
NOTE: recipe dbus-test-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Started
NOTE: recipe libcroco-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2333 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2334 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_configure: Succeeded
NOTE: Running task 2337 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_compile: Succeeded
NOTE: Running task 2338 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_install: Succeeded
NOTE: Running task 2339 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 2340 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package: Succeeded
NOTE: Running task 2341 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata unihash changed to 21dc433285dc1025f3a4074338b9ce1a54e83243cf9966395ce4effc369596ab
NOTE: Setscene tasks completed
NOTE: Running task 2342 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2343 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm unihash changed to 09277a3f945cf4abd910266e2cb575e8ecfecc1c2aff55883dc23dd9810a70e0
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe libcroco-0.6.13-r0: task do_install: Started
NOTE: recipe libcroco-0.6.13-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package)
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot unihash changed to 99293234a3a3f7491e539edec4a8c55eba456fbd04aabcb122870996cdaf7ca3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1639 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1647 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcroco-0.6.13-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata)
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package: Succeeded
NOTE: Running task 2366 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata unihash changed to 65144524060938e5b049dfd1c88b3b8f58bce56b2466745e882a9a6438c55000
NOTE: Setscene tasks completed
NOTE: Running task 2367 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package)
NOTE: Running task 2368 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Started
NOTE: recipe gettext-0.21-r0: task do_package: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm unihash changed to 5422252a8f047ef04b1184e61b75a8172207e124a740c17f3a3b00cf245254f7
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata unihash changed to 6e7ff8783e83acde459f927427b1d4ad9c0e87dbabbb4f173fbc3c21f799ebb7
NOTE: Setscene tasks completed
NOTE: Running task 2369 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 2370 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_configure_ptest_base)
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2372 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_compile)
NOTE: recipe dbus-test-1.12.20-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm unihash changed to 0736c0f8c7a2dcd2f3a6c97182c50bae66a8c52911a352d7150ee923f29e44f3
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata unihash changed to 3f9808ae02d4d0676392d42217b6468afd9dd05c67c5957f5623d7c6cd63953f
NOTE: Running task 2378 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm)
NOTE: Running task 2379 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm unihash changed to b46bf97bac26ab5b2218cb809210e3a9a42c5fac4a4d3ef1e28049b22076c0cb
NOTE: Setscene tasks completed
NOTE: recipe gettext-0.21-r0: task do_package: Succeeded
NOTE: Running task 2380 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata: Succeeded
NOTE: Running task 2381 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package)
NOTE: Running task 2382 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm)
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Started
NOTE: recipe bison-3.7.6-r0: task do_package: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm unihash changed to a980fb96143845ef3d21c3a52963c7898dce65164e5aad777e393c1fe005844c
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm unihash changed to 70c52e80cc860773bd67e6b16da4224580f7cd20a7abb6e5c9535e3539cc1dc1
NOTE: recipe bison-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 2383 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata)
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata unihash changed to 6377afa3637c6b63899aacbc5308a34dc91290540bdb24eff79521e77284a844
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm became valid
NOTE: Running setscene task 1664 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_setscene)
NOTE: Running setscene task 1665 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1666 of 753 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running task 2384 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm unihash changed to e8e87d9ef96c2135ab383cc125cca94c1bda9124c9474efa46404489be971052
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm unihash changed to 3e98b5b43ab240a90faecf2f696cc2080e9dac2ed45fc1fd56fc1451087a4759
NOTE: recipe binutils-2.36.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2388 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm unihash changed to a91d9b8a8e6a4f04cb7015ac0504d3dc3dc60a1af3ea39bed008618451051bd2
NOTE: Running noexec task 2389 of 2389 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.20.bb:do_build)
NOTE: Tasks Summary: Attempted 2389 tasks of which 2174 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8325584886356132040==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-gdbm-upgrade-1.19-1.20.patch"

From 9183420ddc28f0a1b11cd9a5f797a483637f5b1c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 09:26:07 +0000
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


--===============8325584886356132040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdbm/gdbm-bin: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-bin: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-compat: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-compat: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PKGSIZE changed from 801880 to 859532 (+7%)
packages/core2-32-poky-linux/gdbm/gdbm-dbg: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-dev: PKGSIZE changed from 14270 to 14680 (+3%)
packages/core2-32-poky-linux/gdbm/gdbm-dev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-doc: PKGSIZE changed from 179576 to 187167 (+4%)
packages/core2-32-poky-linux/gdbm/gdbm-doc: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PKGSIZE changed from 14387 to 14022 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-da: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PKGSIZE changed from 16763 to 18206 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-de: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PKGSIZE changed from 16039 to 17436 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-eo: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PKGSIZE changed from 14847 to 14486 (-2%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-es: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PKGSIZE changed from 12299 to 11953 (-3%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PKGSIZE changed from 17153 to 18703 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-fr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PKGSIZE changed from 6164 to 5762 (-7%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ja: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PKGSIZE changed from 16737 to 18088 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pl: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PKGSIZE changed from 16594 to 18079 (+9%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-pt-br: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PKGSIZE changed from 21254 to 22974 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-ru: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PKGSIZE changed from 21057 to 22827 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sr: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PKGSIZE changed from 16096 to 17439 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-sv: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PKGSIZE changed from 21800 to 23644 (+8%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-uk: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PKGSIZE changed from 18101 to 17383 (-4%)
packages/core2-32-poky-linux/gdbm/gdbm-locale-vi: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PKGSIZE changed from 325415 to 325414 (-0%)
packages/core2-32-poky-linux/gdbm/gdbm-ptest: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-src: PKGSIZE changed from 397009 to 419951 (+6%)
packages/core2-32-poky-linux/gdbm/gdbm-src: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm-staticdev: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)
packages/core2-32-poky-linux/gdbm/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/gdbm: SRC_URI changed from "https://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz file://run-ptest file://ptest.patch" to "https://ftp.gnu.org/gnu/gdbm/gdbm-1.20.tar.gz file://run-ptest file://ptest.patch"
packages/core2-32-poky-linux/gdbm: PKGV changed from 1.19 [default] to 1.20 [default]
packages/core2-32-poky-linux/gdbm: PV changed from "1.19" to "1.20"
packages/core2-32-poky-linux/perl/perl-dbg: PKGSIZE changed from 16787764 to 16789892 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 15028200 to 15029348 (+0%)

--===============8325584886356132040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdbm/gdbm: PKGSIZE changed from 71080 to 79272 (+12%)

--===============8325584886356132040==--
