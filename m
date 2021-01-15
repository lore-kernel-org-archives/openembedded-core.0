Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.723.1610713823240905993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 77F7738C13D7
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to d3a6e1293c43a6d989d4bcd59132317195d420c6 SUCCEEDED
Message-ID: <MADEUP.165A67B0829B0D43.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146794
Content-Type: multipart/mixed; boundary="===============1596906718997099053=="

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *d3a6e1293c43a6d989d4bcd59132317195d420c6* has Succeeded.

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

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (809 cached, 1 parsed). 1420 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-c44452f85c587225880fb79555b086823235ef22"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c44452f85c587225880fb79555b086823235ef22"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 65 Found 21 Missed 44 Current 715 (32% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 761 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1117 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1499 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1503 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1552 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1579 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1619 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1650 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1715 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1731 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1732 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1846 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1847 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running task 1848 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1982 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Started
NOTE: Running task 1983 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2035 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: Running task 2036 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2037 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2203 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: Running task 2275 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2285 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: Running task 2288 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 2289 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2291 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2293 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2296 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2297 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2298 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2300 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Succeeded
NOTE: Running task 2301 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2302 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: Running task 2323 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2347 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Succeeded
NOTE: Running task 2348 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2349 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2350 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2351 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f9ea6364d345c1bc89076d4dfb4e4e8dc81b660a3dad820f57d5fb71cee738d8
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: Setscene tasks completed
NOTE: Running task 2377 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2389 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2392 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2393 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2394 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2395 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2400 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2403 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2404 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2413 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2420 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2432 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2436 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2436 tasks of which 2332 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 26 seconds

Summary: There were 35 ERROR messages shown, returning a non-zero exit code.

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 68 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-c44452f85c587225880fb79555b086823235ef22"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c44452f85c587225880fb79555b086823235ef22"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 65 Found 21 Missed 44 Current 715 (32% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 761 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1117 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1500 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1504 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1552 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1580 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1631 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1662 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1727 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1743 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 1744 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1857 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1858 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1859 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1860 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1861 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1862 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1893 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Succeeded
NOTE: Running task 1918 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1919 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1955 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: Running task 1987 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2088 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2212 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2290 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2291 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2293 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2295 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2297 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2298 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2299 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: Running task 2320 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2326 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2343 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2344 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2345 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2346 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Succeeded
NOTE: Running task 2347 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: Setscene tasks completed
NOTE: Running task 2374 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2378 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Succeeded
NOTE: Running task 2379 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2380 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2381 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f9ea6364d345c1bc89076d4dfb4e4e8dc81b660a3dad820f57d5fb71cee738d8
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2389 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: Running task 2392 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2394 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2395 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2400 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2403 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2404 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2409 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2410 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2411 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: Running task 2412 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2413 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2420 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2432 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2436 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2436 tasks of which 2332 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 35 ERROR messages shown, returning a non-zero exit code.

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 117 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-c44452f85c587225880fb79555b086823235ef22"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c44452f85c587225880fb79555b086823235ef22"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 580 Found 535 Missed 45 Current 211 (92% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 212 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 270 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 271 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 276 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 278 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 279 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 280 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 281 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 286 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 325 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 327 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 340 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 341 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 343 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 344 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 357 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 361 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 362 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 369 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 370 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 372 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: Running setscene task 373 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 374 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 378 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 381 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 382 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 390 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 392 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 420 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 426 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 450 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 460 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running setscene task 468 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 729 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 731 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 749 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running task 762 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 767 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 781 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 805 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 814 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 815 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: Running setscene task 494 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 499 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 511 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1053 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1054 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1057 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1060 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: Running task 1061 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: Running task 1062 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1065 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: Running task 1066 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1093 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 534 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1118 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running setscene task 538 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1120 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1121 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: Running task 1122 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1127 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 1136 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1141 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 552 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 560 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1150 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1151 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 577 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 579 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1193 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1194 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 595 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 600 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Started
NOTE: Running setscene task 607 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 608 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1201 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f9ea6364d345c1bc89076d4dfb4e4e8dc81b660a3dad820f57d5fb71cee738d8
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 611 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1210 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1211 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1212 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 623 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 629 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 632 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1234 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 646 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1255 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 1268 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 670 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 671 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 672 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1286 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 678 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1325 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 729 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 732 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 735 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 745 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 761 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1406 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 766 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8aee874b86bf32f2d6775679a54b0a6b02a3acbb944a6280782ba5b76ec44d91
NOTE: Running task 1410 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 777 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 785 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 786 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 789 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 790 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 791 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 791 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1733 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1994 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1999 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2127 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 606c018e80990d3d160802f550d145d7183be4710cf26edb902f108f7c3dc2e0
NOTE: Running task 2353 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2398 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2399 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2400 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2401 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2402 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2403 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2404 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2405 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2406 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2407 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2408 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: Running task 2409 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2410 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2411 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2412 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2413 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2414 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2415 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2416 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2417 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2418 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2419 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2420 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2421 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2423 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2425 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2426 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2427 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2428 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2430 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2431 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2432 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2433 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2434 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2437 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2438 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2439 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2440 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2441 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2442 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2443 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2444 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2449 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2450 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Succeeded
NOTE: Running task 2451 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2453 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Succeeded
NOTE: Running task 2454 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Succeeded
NOTE: Running task 2455 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2456 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2457 of 2457 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2457 tasks of which 2347 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 35 ERROR messages shown, returning a non-zero exit code.

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 59 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-c44452f85c587225880fb79555b086823235ef22"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c44452f85c587225880fb79555b086823235ef22"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 65 Found 21 Missed 44 Current 715 (32% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 761 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1117 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1500 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1503 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1552 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1580 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1621 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1651 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1716 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
NOTE: Running task 1732 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
NOTE: Running task 1734 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Started
NOTE: Running task 1954 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1955 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
NOTE: Running task 1956 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1957 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1958 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1959 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Succeeded
NOTE: Running task 2077 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2085 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: Running task 2086 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 2087 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2112 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2285 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2286 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2287 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2288 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2291 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2293 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2295 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2296 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2297 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2298 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2299 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2300 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2301 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Succeeded
NOTE: Running task 2302 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: Running task 2323 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2346 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2347 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2348 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: Setscene tasks completed
NOTE: Running task 2355 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2356 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2376 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: Running task 2380 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2381 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f9ea6364d345c1bc89076d4dfb4e4e8dc81b660a3dad820f57d5fb71cee738d8
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2382 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2383 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2386 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2387 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2389 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2391 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2392 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2393 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2394 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2395 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2400 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2401 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2403 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2404 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2413 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2420 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2432 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2436 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2436 tasks of which 2332 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 35 ERROR messages shown, returning a non-zero exit code.

--===============1596906718997099053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 2e065c4c451c0256c978ab8d363aa4d23332cb58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 09:03:35 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...nder-ops.c-add-missing-format-string.patch | 24 -------------------
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch b/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
deleted file mode 100644
index 261d98d8f6..0000000000
--- a/meta/recipes-graphics/piglit/piglit/0001-render-ops.c-add-missing-format-string.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From e21e68f6aa0f5249fce613e8fd4ac0edbd5cb7b0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 22 Dec 2020 13:35:11 +0100
-Subject: [PATCH] render-ops.c: add missing format string
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/spec/ati_fragment_shader/render-ops.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/spec/ati_fragment_shader/render-ops.c b/tests/spec/ati_fragment_shader/render-ops.c
-index 131334ba2..19a353d67 100644
---- a/tests/spec/ati_fragment_shader/render-ops.c
-+++ b/tests/spec/ati_fragment_shader/render-ops.c
-@@ -393,7 +393,7 @@ piglit_display(void)
- 		bool ok = piglit_probe_rect_halves_equal_rgba(get_test_x(i), get_test_y(i),
- 							      w * 2, h);
- 		enum piglit_result sub_result = ok ? PIGLIT_PASS : PIGLIT_FAIL;
--		piglit_report_subtest_result(sub_result, test->name);
-+		piglit_report_subtest_result(sub_result, "%s", test->name);
- 		piglit_merge_result(&result, sub_result);
- 	}
- 
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 442c1a3c62..484b59df00 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,11 +13,10 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-serializer.py-make-.gz-files-reproducible.patch \
            file://0001-framework-profile.py-make-test-lists-reproducible.patch \
            file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
-           file://0001-render-ops.c-add-missing-format-string.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "603deba4ab66e2a8948693a14d715e536caddcc5"
+SRCREV = "d3a6e1293c43a6d989d4bcd59132317195d420c6"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.27.0


--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 50 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-c44452f85c587225880fb79555b086823235ef22"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c44452f85c587225880fb79555b086823235ef22"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 65 Found 21 Missed 44 Current 715 (32% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 761 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1117 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1499 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_fetch)
NOTE: Running task 1503 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_fetch)
NOTE: Running task 1551 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1579 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_fetch)
NOTE: Running task 1620 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1650 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running task 1715 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_write_config)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running task 1731 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1732 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_fetch)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxt-1_1.2.0-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libglu-2_9.0.1-0: task do_fetch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Started
NOTE: Running task 1783 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_unpack)
NOTE: Running task 1784 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_prepare_recipe_sysroot)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1785 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_unpack)
NOTE: Running task 1786 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1809 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_unpack)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: Running task 1849 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
ERROR: mesa-2_20.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:20.3.3-r0 to 2:20.3.1-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Started
NOTE: recipe waffle-1.6.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: Running task 1998 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_unpack)
NOTE: Running task 1999 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 2000 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_fetch: Succeeded
NOTE: Running setscene task 780 of 780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 2012 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libglu-2_9.0.1-0: task do_unpack: Succeeded
NOTE: Running task 2055 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Started
NOTE: Running task 2145 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 2268 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Started
NOTE: recipe waffle-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_patch)
NOTE: recipe libxt-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2277 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: Running task 2289 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_patch: Succeeded
NOTE: Running task 2291 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2292 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2293 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2294 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2295 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libglu-2_9.0.1-0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2296 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2297 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2298 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2299 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.1-0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running task 2300 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_configure)
NOTE: recipe python3-mako-1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2301 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: Running task 2322 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2344 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2346 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_unpack: Succeeded
NOTE: Running task 2348 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2349 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: Setscene tasks completed
NOTE: Running task 2375 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_patch: Succeeded
NOTE: Running task 2379 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2380 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2381 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-mako-1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Started
NOTE: recipe waffle-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2383 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to f9ea6364d345c1bc89076d4dfb4e4e8dc81b660a3dad820f57d5fb71cee738d8
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2384 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_compile)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2385 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Started
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
ERROR: python3-mako-1.1.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.1.4-r0 to 0:1.1.3-r0) [version-going-backwards]
NOTE: recipe python3-mako-1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2386 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.1.3.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_install)
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package)
NOTE: Running task 2389 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.6.1-r0: task do_package: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2390 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_packagedata)
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_configure: Succeeded
NOTE: Running task 2391 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Started
NOTE: recipe waffle-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2392 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.6.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.1-0: task do_compile: Succeeded
NOTE: Running task 2393 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2394 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_compile)
NOTE: recipe libglu-2_9.0.1-0: task do_install: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.1-0: task do_install: Succeeded
NOTE: Running task 2395 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_populate_sysroot)
NOTE: Running task 2396 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package)
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Started
NOTE: recipe libglu-2_9.0.1-0: task do_populate_sysroot: Succeeded
NOTE: Running task 2397 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2398 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_install)
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2399 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: Running task 2400 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2401 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2403 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.1-0: task do_package: Succeeded
NOTE: Running task 2404 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.1-0: task do_packagedata: Succeeded
NOTE: Running task 2405 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.1.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2406 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.1-0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2407 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_configure: Succeeded
NOTE: Running task 2408 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2409 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2410 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 2411 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 2412 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2413 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2414 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2415 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 2416 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2417 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package_write_rpm)
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2418 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 2419 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 2420 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2421 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2422 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 2423 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2424 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package_write_rpm)
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2425 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 2428 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2429 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_install: Succeeded
NOTE: Running task 2431 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2432 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package: Succeeded
NOTE: Running task 2433 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_packagedata: Succeeded
NOTE: Running task 2434 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2435 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d3a6e1293c-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2436 of 2436 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2436 tasks of which 2332 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 35 ERROR messages shown, returning a non-zero exit code.

--===============1596906718997099053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+603deba4ab [default] to 1.0+gitrAUTOINC+d3a6e1293c [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https file://0001-cmake-install-bash-completions-in-the-right-place.patch file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0001-Add-a-missing-include-for-htobe32-definition.patch file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-serializer.py-make-.gz-files-reproducible.patch file://0001-framework-profile.py-make-test-lists-reproducible.patch file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch file://0001-render-ops.c-add-missing-format-string.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https file://0001-cmake-install-bash-completions-in-the-right-place.patch file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0001-Add-a-missing-include-for-htobe32-definition.patch file://0001-generated_te
 sts-gen_tcs-tes_input_tests.py-do-not-ha.patch file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0001-serializer.py-make-.gz-files-reproducible.patch file://0001-framework-profile.py-make-test-lists-reproducible.patch file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+603deba4ab to 1.0+gitr0+d3a6e1293c
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2041444161 to 2041486645 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+603deba4ab" to "1.0+gitrAUTOINC+d3a6e1293c"

--===============1596906718997099053==--
