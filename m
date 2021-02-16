Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6849038C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 166 SUCCEEDED
Message-ID: <MADEUP.16642CD3CEA35B60.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148155
Content-Type: multipart/mixed; boundary="===============3231445255838150410=="

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *166* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-164-166.patch
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

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 41 skipped, 0 masked, 0 errors.
Removing 133 recipes from the core2-32 sysroot...done.
Removing 137 recipes from the qemux86 sysroot...done.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-166-py3.9.egg-info

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 44 Found 13 Missed 31 Current 929 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 934 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 946 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 967 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 969 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 970 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1054 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-src went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dbg went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-staticdev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-doc went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-locale went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2136 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_fetch)
NOTE: Running task 2205 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2206 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2207 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2208 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2304 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
NOTE: recipe diffoscope-166-r0: task do_fetch: Started
NOTE: recipe diffoscope-166-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: Running task 2482 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_unpack)
NOTE: Running task 2483 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2509 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: Running task 2526 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2538 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: Running task 2539 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2540 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2541 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2542 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2543 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
NOTE: Running task 2620 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-166-r0: task do_unpack: Started
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2756 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-166-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2780 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: Running task 2781 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe diffoscope-166-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2885 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2886 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe diffoscope-166-r0: task do_patch: Succeeded
NOTE: Running task 2887 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_deploy_source_date_epoch)
NOTE: Running task 2888 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2889 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2890 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2891 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Started
NOTE: Running task 2892 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2893 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2894 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2895 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic unihash changed to bc204cc3c8c075f499034e309a51e730d7b4722aca5125312345b05cfdd4d019
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2896 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2897 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe diffoscope-166-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2898 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: Running task 2899 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9be73892817ccae6a1679d6602b61f68cb686db2a571abe1d29b85f617ac1e25
NOTE: recipe diffoscope-166-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: Running task 2985 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_compile)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2995 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe diffoscope-166-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3007 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3008 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3009 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe diffoscope-166-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3012 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe diffoscope-166-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 34ae1f9d59024cf3248f55464cec110c7b18e0eb3d540ee9ad905def0f031610
NOTE: Setscene tasks completed
NOTE: Running task 3070 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3075 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3076 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-166-r0: task do_install: Succeeded
NOTE: Running task 3078 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package)
NOTE: Running task 3079 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_sysroot)
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-166-r0: task do_package: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3081 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3082 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe diffoscope-166-r0: task do_package: Succeeded
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: Running task 3084 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_packagedata)
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe diffoscope-166-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3086 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3087 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3093 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: Running task 3095 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3099 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3101 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_build)
NOTE: Tasks Summary: Attempted 3101 tasks of which 3026 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 44 Found 13 Missed 31 Current 929 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 934 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 946 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 967 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 969 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 970 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1054 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-src went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dbg went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-staticdev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-doc went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-locale went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2136 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_fetch)
NOTE: Running task 2205 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2206 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2207 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2208 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2305 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
NOTE: recipe diffoscope-166-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe diffoscope-166-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: Running task 2443 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_unpack)
NOTE: Running task 2447 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2448 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2449 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2469 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2539 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2540 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2541 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2542 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
NOTE: Running task 2543 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-166-r0: task do_unpack: Started
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: Running task 2622 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: Running task 2686 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe diffoscope-166-r0: task do_unpack: Succeeded
NOTE: Running task 2707 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe diffoscope-166-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2885 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-166-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2887 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2888 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2889 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2890 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2891 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2892 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2893 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2894 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2895 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_configure)
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic unihash changed to bc204cc3c8c075f499034e309a51e730d7b4722aca5125312345b05cfdd4d019
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2896 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: Running task 2897 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe diffoscope-166-r0: task do_configure: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: Running task 2898 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 947b3f3eeb0dfbbf6b71a2570cf7038cea898c207019c744a3a1ca5df19e8530
NOTE: recipe diffoscope-166-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_compile)
NOTE: Running task 2990 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: Running task 2991 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: Running task 2993 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: Running task 2995 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: Running task 2996 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe diffoscope-166-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3008 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe diffoscope-166-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: recipe diffoscope-166-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3012 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0b1db967e13a1cce76dacb0a93759952734dd0c6028b6c011e72a5e0f26fbaff
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3070 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3075 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3077 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-166-r0: task do_install: Succeeded
NOTE: Running task 3078 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package)
NOTE: Running task 3079 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_sysroot)
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-166-r0: task do_package: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3081 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3082 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3083 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3084 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package: Succeeded
NOTE: Running task 3085 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_packagedata)
NOTE: recipe diffoscope-166-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-166-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3086 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3087 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3092 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3094 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_write_rpm)
NOTE: Running task 3095 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3099 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3101 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_build)
NOTE: Tasks Summary: Attempted 3101 tasks of which 3026 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============3231445255838150410==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-164-166.patch"

From eb67a1e41d9403bc28b9e206b9aff278bfb3a7d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 06:53:09 +0000
Subject: [PATCH] diffoscope: upgrade 164 -> 166

---
 .../diffoscope/{diffoscope_164.bb => diffoscope_166.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_164.bb => diffoscope_166.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_164.bb b/meta/recipes-support/diffoscope/diffoscope_166.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_164.bb
rename to meta/recipes-support/diffoscope/diffoscope_166.bb
index 7707c441ca..14c95fe5af 100644
--- a/meta/recipes-support/diffoscope/diffoscope_164.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_166.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bc269a39ec72261d9fead55bd951f6cbbe3d2ccce1481f974665999a5b141fff"
+SRC_URI[sha256sum] = "20d0b4091ae535dc7d094bf5f366e0687e0b4337a268254b11925b8e7c9ea9c4"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.17.1


--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1428 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 44 Found 13 Missed 31 Current 929 (29% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 934 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 946 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 967 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 969 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 970 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1054 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-src went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dbg went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-staticdev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-doc went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-locale went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2136 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_fetch)
NOTE: Running task 2205 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2206 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2207 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2208 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2304 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
NOTE: recipe diffoscope-166-r0: task do_fetch: Started
NOTE: recipe diffoscope-166-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: Running task 2472 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_unpack)
NOTE: Running task 2473 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: Running task 2504 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: Running task 2525 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2538 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: Running task 2539 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2540 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2541 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: Running task 2542 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2543 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
NOTE: recipe diffoscope-166-r0: task do_unpack: Started
NOTE: Running task 2620 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-166-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2755 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: Running task 2756 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_patch)
NOTE: Running task 2776 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe diffoscope-166-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2885 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2886 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-166-r0: task do_patch: Succeeded
NOTE: Running task 2887 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_deploy_source_date_epoch)
NOTE: Running task 2888 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2889 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2890 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2891 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2892 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2893 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2894 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2895 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_configure)
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic unihash changed to bc204cc3c8c075f499034e309a51e730d7b4722aca5125312345b05cfdd4d019
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2896 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: Running task 2897 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2898 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe diffoscope-166-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2899 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe diffoscope-166-r0: task do_configure: Succeeded
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2900 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_compile)
NOTE: Running task 2901 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 517200faa79489c03aaee74d243275f29de67290a89364e59cd5fcf52c63e1e4
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-166-r0: task do_compile: Started
NOTE: Running task 2995 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: Running task 2996 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2997 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3008 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe diffoscope-166-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe diffoscope-166-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: Running task 3011 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3012 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 4d36386f84f1f8a6eeadb3b159bce7be17a46afff77c0a8da00b9ade299130f5
NOTE: Setscene tasks completed
NOTE: Running task 3070 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3075 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Running task 3076 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe diffoscope-166-r0: task do_install: Succeeded
NOTE: Running task 3078 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package)
NOTE: Running task 3079 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_sysroot)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3081 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3083 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe diffoscope-166-r0: task do_package: Succeeded
NOTE: Running task 3084 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_packagedata)
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe diffoscope-166-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3086 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3087 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3088 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3089 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3092 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3093 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3094 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_write_rpm)
NOTE: Running task 3095 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3099 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3100 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3101 of 3101 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_build)
NOTE: Tasks Summary: Attempted 3101 tasks of which 3026 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1429 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1428 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f029e8ff9948a14e3ab5a80b9b5e627499d0a9d6"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 46 Found 15 Missed 31 Current 931 (32% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 936 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 948 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 969 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 977 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.45.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 972 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 973 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1054 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-src went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dbg went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-staticdev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-dev went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-doc went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt-locale went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
ERROR: libxt-1_1.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxt went backwards which would break package feeds (from 1:1.2.1-r0 to 1:1.2.0-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 977 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.45.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 977 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.45.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.45.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2154 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_fetch)
NOTE: Running task 2223 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_fetch)
NOTE: Running task 2224 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2225 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_fetch)
NOTE: Running task 2226 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_fetch)
NOTE: Running task 2322 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_fetch)
NOTE: recipe diffoscope-166-r0: task do_fetch: Started
NOTE: recipe diffoscope-166-r0: task do_fetch: Succeeded
NOTE: Running task 2458 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_unpack)
NOTE: Running task 2465 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_fetch: Succeeded
NOTE: Running task 2487 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_unpack)
NOTE: recipe vim-8.2-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2530 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Started
NOTE: Running task 2556 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2557 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2582 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_unpack)
NOTE: recipe diffoscope-166-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_fetch: Succeeded
NOTE: Running task 2631 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_unpack)
NOTE: Running task 2632 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-166-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2742 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_patch)
NOTE: Running task 2755 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_unpack)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2756 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2757 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_patch)
NOTE: recipe vim-8.2-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-166-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_unpack: Succeeded
NOTE: Running task 2902 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_patch)
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Started
NOTE: recipe diffoscope-166-r0: task do_patch: Succeeded
NOTE: Running task 2903 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_deploy_source_date_epoch)
NOTE: Running task 2904 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic)
NOTE: recipe diffoscope-166-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_patch: Succeeded
NOTE: Running task 2905 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_patch: Succeeded
NOTE: Running task 2906 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_populate_lic: Succeeded
NOTE: recipe diffoscope-166-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_lic unihash changed to bc204cc3c8c075f499034e309a51e730d7b4722aca5125312345b05cfdd4d019
NOTE: Running task 2907 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2908 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2909 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2910 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_configure)
NOTE: recipe libarchive-3.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-166-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_unpack: Succeeded
NOTE: Running task 2911 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Started
NOTE: recipe diffoscope-166-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_compile)
NOTE: recipe python3-magic-0.4.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2913 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_configure)
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_configure: Succeeded
NOTE: Running task 2914 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2915 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_patch)
NOTE: recipe diffoscope-166-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Started
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_patch: Succeeded
NOTE: Running task 2916 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2917 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 2e06541ff4c1e71ad371a85f393c3f35ed840fa219ee311f9a83df5e15081efc
NOTE: recipe libarchive-3.5.1-r0: task do_patch: Succeeded
NOTE: Running task 3008 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3014 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3023 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-166-r0: task do_compile: Succeeded
NOTE: Running task 3024 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_install)
NOTE: Running task 3025 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_install)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 3026 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3027 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3028 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_patch)
NOTE: recipe squashfs-tools-4.4-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: Running task 3029 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Started
NOTE: recipe diffoscope-166-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Started
NOTE: recipe vim-8.2-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 664e107f7e4384d7a71270232afba85e211fe63f8509de7e39ef4650d4c4d829
NOTE: Setscene tasks completed
NOTE: Running task 3060 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package)
NOTE: Running task 3088 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.18-r0: task do_install: Succeeded
NOTE: Running task 3093 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vim-8.2-r0: task do_patch: Succeeded
NOTE: Running task 3094 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-166-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package)
NOTE: Running task 3096 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_populate_sysroot)
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-166-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3097 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_configure)
NOTE: recipe vim-8.2-r0: task do_configure: Started
NOTE: recipe diffoscope-166-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.18-r0: task do_package: Succeeded
NOTE: Running task 3099 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_compile: Succeeded
NOTE: Running task 3100 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-libarchive-c-2.9-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_install: Succeeded
NOTE: Running task 3101 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-src went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dbg went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-staticdev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-dev went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Started
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-doc went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic-locale went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
ERROR: python3-magic-0.4.18-r0 do_packagedata: QA Issue: Package version for package python3-magic went backwards which would break package feeds (from 0:0.4.20-r0 to 0:0.4.18-r0) [version-going-backwards]
NOTE: recipe python3-magic-0.4.18-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.18.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package: Succeeded
NOTE: Running task 3103 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_packagedata)
NOTE: recipe diffoscope-166-r0: task do_packagedata: Started
NOTE: recipe diffoscope-166-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.18-r0: task do_package_write_rpm: Succeeded
NOTE: recipe squashfs-tools-4.4-r0: task do_package: Succeeded
NOTE: Running task 3104 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3105 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-8.2-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_compile)
NOTE: recipe vim-8.2-r0: task do_compile: Started
NOTE: recipe vim-8.2-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_install)
NOTE: recipe vim-8.2-r0: task do_install: Started
NOTE: recipe vim-8.2-r0: task do_install: Succeeded
NOTE: Running task 3108 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package)
NOTE: recipe vim-8.2-r0: task do_package: Started
NOTE: recipe vim-8.2-r0: task do_package: Succeeded
NOTE: Running task 3109 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_packagedata)
NOTE: recipe vim-8.2-r0: task do_packagedata: Started
NOTE: recipe vim-8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3110 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_8.2.bb:do_package_write_rpm)
NOTE: Running task 3111 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_write_rpm)
NOTE: Running task 3112 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_package_qa)
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Started
NOTE: recipe libarchive-3.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3113 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_compile)
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Started
NOTE: recipe diffoscope-166-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-166-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3114 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_install)
NOTE: recipe libarchive-3.5.1-r0: task do_install: Started
NOTE: recipe libarchive-3.5.1-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package)
NOTE: recipe libarchive-3.5.1-r0: task do_package: Started
NOTE: recipe libarchive-3.5.1-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm)
NOTE: Running task 3118 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb:do_package_write_rpm)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Started
NOTE: recipe vim-8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3119 of 3119 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_166.bb:do_build)
NOTE: Tasks Summary: Attempted 3119 tasks of which 3044 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 14 ERROR messages shown, returning a non-zero exit code.

--===============3231445255838150410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 935074 to 937936 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "164" to "166"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 164 [default] to 166 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-164.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-166.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "164" to "166"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.9/site-packages/diffoscope-164-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/diffoscope-166-py3.9.egg-info

--===============3231445255838150410==--
