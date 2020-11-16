Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.39207.1605551304346978489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 87A5F38C13C6
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 0fda9f67a782edec640998286e7b6058e8933d17 SUCCEEDED
Message-ID: <MADEUP.16481067A9390A52.27635@lists.openembedded.org>
X-Groupsio-MsgNum: 144656
Content-Type: multipart/mixed; boundary="===============4152283732665069424=="

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *0fda9f67a782edec640998286e7b6058e8933d17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1406 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (787 cached, 4 parsed). 1372 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 66 Found 26 Missed 40 Current 715 (39% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 725 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 728 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1495 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1540 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1594 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: Running task 1626 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: Running task 1663 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1686 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1687 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1710 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1714 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1748 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 1749 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1765 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: Running task 1799 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: Running task 1881 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: Running task 1954 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: Running task 1966 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: Running task 2004 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2005 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2110 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2161 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: Running task 2162 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2193 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: Running task 2234 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2280 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 775 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2319 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2323 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: Running task 2331 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2335 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2336 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2348 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2353 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 5f5493d505208a48a038d054d19884707a5a3ec9d4bc64c240c8c1c8e623aeb2
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2375 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2379 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2386 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2389 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2391 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2392 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2401 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2417 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2429 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2432 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2433 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2433 tasks of which 2334 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1430 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 66 Found 26 Missed 40 Current 715 (39% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 725 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 728 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1496 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1540 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1594 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1626 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: Running task 1677 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1678 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1679 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1708 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1714 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1749 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1750 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1773 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1794 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2000 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: Running task 2004 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: Running task 2027 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2028 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2080 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2133 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2173 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: Running task 2183 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2249 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 775 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: Running task 2276 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2319 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2320 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2321 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2323 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 778 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2331 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2345 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2350 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 2372 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2373 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2374 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2375 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 5f5493d505208a48a038d054d19884707a5a3ec9d4bc64c240c8c1c8e623aeb2
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2379 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2386 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2389 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2391 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2392 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2394 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2395 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2401 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2417 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2429 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2432 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2433 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2433 tasks of which 2334 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1406 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (787 cached, 4 parsed). 1372 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 66 Found 26 Missed 40 Current 715 (39% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 725 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 728 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1496 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1540 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1594 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1626 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1682 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1683 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1713 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1724 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1748 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1750 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1765 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: Running task 1824 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: Running task 1898 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2003 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: Running task 2011 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: Running task 2012 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: Running task 2013 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2144 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2212 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2227 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2261 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2299 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2319 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2321 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2323 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2328 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2331 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2333 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 2335 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2336 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: Setscene tasks completed
NOTE: Running task 2348 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2353 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2375 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 5f5493d505208a48a038d054d19884707a5a3ec9d4bc64c240c8c1c8e623aeb2
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: Running task 2376 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2377 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2379 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2383 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2384 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2386 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2389 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2391 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2392 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2393 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2394 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2395 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2396 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2397 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2401 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2402 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2403 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2406 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2407 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2417 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2429 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2432 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2433 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2433 tasks of which 2334 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+59e695c16f-r0'])", added "piglit (['= 1.0+gitr0+0fda9f67a7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+59e695c16f-r0'])", added "piglit-dev (['= 1.0+gitr0+0fda9f67a7-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7

--===============4152283732665069424==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 2e1b5efdc648de05a631005193fa3da06c7356ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 17:03:01 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a9d1d39dfe..6dacc4bcbf 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "59e695c16fdcdd4ea4f16365f0e397a93cef7b80"
+SRCREV = "0fda9f67a782edec640998286e7b6058e8933d17"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.20.1


--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1406 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (787 cached, 4 parsed). 1372 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 66 Found 26 Missed 40 Current 715 (39% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 724 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 725 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 728 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 733 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1495 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1540 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1594 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: Running task 1626 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: Running task 1662 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1678 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1679 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 771 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: Running task 1704 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1714 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1749 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1750 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1766 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: Running task 1776 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1843 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1889 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1933 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1956 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: Running task 2004 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2062 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2090 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2115 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2126 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 2180 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2219 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2310 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2311 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2312 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2313 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2314 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 2315 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2316 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2317 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 5f5493d505208a48a038d054d19884707a5a3ec9d4bc64c240c8c1c8e623aeb2
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2318 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2334 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2335 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: Running task 2336 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2338 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2350 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2355 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2379 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2380 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2382 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2383 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2384 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2385 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2386 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2388 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2389 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2390 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2391 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2392 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2393 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2394 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2395 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2398 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2399 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2400 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2401 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2402 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2403 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2404 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2407 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2409 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2410 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2411 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2412 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2413 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2414 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2415 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2416 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2417 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2419 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2429 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2432 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2433 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2433 tasks of which 2334 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 17 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1415 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 179 Found 171 Missed 8 Current 602 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1660 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: Running task 2419 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2420 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: Running task 2421 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 2422 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2423 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2424 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2425 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2429 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2430 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+0fda9f67a7-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+59e695c16f-r0 to 0:1.0+gitr0+0fda9f67a7-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2431 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2432 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2433 of 2433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2433 tasks of which 2417 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1406 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (787 cached, 4 parsed). 1372 targets, 46 skipped, 0 masked, 0 errors.
Removing 121 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:fba90db2c69f6ca6a98e6053ae378e14594e88c2"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 591 Found 550 Missed 41 Current 201 (93% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 202 of 792 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 261 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 262 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 267 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 269 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 270 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 308 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 311 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 315 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 329 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 338 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 344 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 349 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 352 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 353 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 354 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 355 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 358 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 359 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 361 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_package_write_rpm_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 364 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 366 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 368 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 369 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe libxkbcommon-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 370 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 672 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 673 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 693 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 699 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 704 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 719 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running setscene task 373 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running task 736 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 752 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 753 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: Running setscene task 384 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Started
NOTE: Running task 886 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 888 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 889 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 890 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 896 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 401 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 929 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 938 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running setscene task 417 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 418 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 944 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_fetch: Succeeded
NOTE: Running task 946 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 432 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 452 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 453 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 455 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 458 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 1039 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1040 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1041 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 497 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 498 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 502 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1046 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1051 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1052 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1053 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 515 of 792 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 524 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 529 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 538 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_packagedata_setscene)
NOTE: Running task 1108 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.2.2-r0 to 2:20.2.1-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 556 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 570 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 582 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 590 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 603 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 607 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 640 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 658 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 669 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1260 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_patch: Succeeded
NOTE: Running task 1269 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1270 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1271 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 702 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_lic: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 5f5493d505208a48a038d054d19884707a5a3ec9d4bc64c240c8c1c8e623aeb2
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 718 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 739 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 741 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 773 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 785 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 792 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1971 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1972 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2035 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2149 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2395 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2396 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2397 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2399 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2400 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: Running task 2402 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2405 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2408 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2409 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2410 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2411 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2412 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2413 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2414 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2415 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2416 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2420 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2422 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2424 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2425 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2426 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2427 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2428 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2429 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2430 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2431 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_configure: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: Running task 2433 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Started
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2434 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2438 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2439 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2440 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2442 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2444 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2445 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2450 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package: Succeeded
NOTE: Running task 2451 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_packagedata: Succeeded
NOTE: Running task 2452 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2453 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+0fda9f67a7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2454 of 2454 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2454 tasks of which 2355 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============4152283732665069424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+59e695c16f [default] to 1.0+gitrAUTOINC+0fda9f67a7 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+59e695c16f-r0'])", added "piglit (['= 1.0+gitr0+0fda9f67a7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22591 to 22882 (+1%)
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+59e695c16f-r0'])", added "piglit-dev (['= 1.0+gitr0+0fda9f67a7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+59e695c16f" to "1.0+gitrAUTOINC+0fda9f67a7"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+59e695c16f to 1.0+gitr0+0fda9f67a7
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2041694928 to 2041787524 (+0%)

--===============4152283732665069424==--
