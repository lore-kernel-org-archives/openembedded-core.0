Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7616.1625391858590542065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id C997438C1265
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 21.1.4 SUCCEEDED
Message-ID: <MADEUP.168E8D48AC2C3E04.9961@lists.openembedded.org>
X-Groupsio-MsgNum: 153534
Content-Type: multipart/mixed; boundary="===============7773808223378456213=="

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *21.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mesa-upgrade-21.1.3-21.1.4.patch
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

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 50 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a9a15a17790c28b9696bb4732b987375630c3519"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a9a15a17790c28b9696bb4732b987375630c3519"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 1 Network 0 Missed 56 Current 759 (1% match, 93% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1597 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1645 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1696 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1697 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1698 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_fetch)
NOTE: Running task 1699 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1700 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1782 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 1825 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1905 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1906 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1907 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1908 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1946 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1947 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1977 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2027 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 2028 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 2029 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2030 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_unpack)
NOTE: Running task 2031 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 2032 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 2033 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Started
NOTE: Running task 2041 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2124 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2354 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2355 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: Running task 2356 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 2357 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2360 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: Running task 2361 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2363 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2364 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2365 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2366 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2367 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2369 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2373 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2374 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2375 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: Running task 2376 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2378 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3ac43696b851485adafba19a643f135a128833e98a29f0334cd75440e1a4e9
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2442 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2443 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b169c09b3341afe1cc48221181569c738481714a299e3f58e326f2a67a108e3b
NOTE: Setscene tasks completed
NOTE: Running task 2480 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic unihash changed to 3234434785a17a813cca01428e77f2db72a7ae18a18a3989ddf5761cc44d0fbf
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_install)
NOTE: recipe libdrm-2.4.106-r0: task do_install: Started
NOTE: recipe libdrm-2.4.106-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package)
NOTE: Running task 2491 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Started
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 2497 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2499 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2500 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2502 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2503 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2504 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2505 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: Running task 2506 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2509 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: Running task 2511 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2512 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2513 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2514 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2515 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2516 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2518 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2519 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2520 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2521 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2523 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2524 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2525 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: Running task 2527 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2531 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2532 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2534 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2535 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: Running task 2537 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2538 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2543 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2546 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: Running task 2547 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2548 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 2555 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 2556 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2557 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: Running task 2558 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_qa)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2559 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2559 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (816 cached, 2 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a9a15a17790c28b9696bb4732b987375630c3519"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a9a15a17790c28b9696bb4732b987375630c3519"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 1 Network 0 Missed 56 Current 759 (1% match, 93% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1597 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1645 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1696 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_fetch)
NOTE: Running task 1697 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1698 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1699 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1700 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1782 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: Running task 1825 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1841 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1842 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: Running task 1872 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1889 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1890 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1919 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1974 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_unpack)
NOTE: Running task 1975 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1976 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1977 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1978 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: Running task 1992 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2041 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: Running task 2055 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2260 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 2273 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2356 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: Running task 2357 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 2360 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2361 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2362 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2364 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2365 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 2371 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2373 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2374 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2375 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2376 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2378 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to db6c413a4896ec7bf862364677c4dcbd28a03d4718a5b45cc6aa9fa6ae3d9b25
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2442 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2443 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5d4d3efc78424bd89260522c7c76ae2f5d48c022ed0e373ad4d4dd9b6e8201dd
NOTE: Setscene tasks completed
NOTE: Running task 2481 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic unihash changed to 3234434785a17a813cca01428e77f2db72a7ae18a18a3989ddf5761cc44d0fbf
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_install)
NOTE: recipe libdrm-2.4.106-r0: task do_install: Started
NOTE: recipe libdrm-2.4.106-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package)
NOTE: Running task 2491 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Started
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2498 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2501 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2503 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: Running task 2505 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2506 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2509 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: Running task 2510 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2511 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2513 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm)
NOTE: Running task 2514 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: Running task 2515 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2516 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2519 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2520 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 2521 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2523 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2524 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2525 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: Running task 2527 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2531 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: Running task 2533 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2534 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2535 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: Running task 2537 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2538 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2543 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2546 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: Running task 2547 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2548 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 2555 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 2556 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2557 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: Running task 2558 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_qa)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2559 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2559 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa: SRC_URI changed from "https://mesa.freedesktop.org/archive/mesa-21.1.3.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch" to "https://mesa.freedesktop.org/archive/mesa-21.1.4.tar.xz file://0001-meson.build-check-for-all-linux-host_os-combinations.patch file://0002-meson.build-make-TLS-ELF-optional.patch file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch"
packages/core2-32-poky-linux/mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libegl-mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libegl-mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libegl-mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgbm-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgbm-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgbm: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgbm: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgl-mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgl-mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgl-mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libglapi-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libglapi-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libglapi: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libglapi: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles1-mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles1-mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles1-mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles2-mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles2-mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles2-mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles3-mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libgles3-mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libgles3-mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libosmesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libosmesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libosmesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libosmesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libxatracker-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libxatracker-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/libxatracker: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/libxatracker: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-dbg: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGSIZE changed from 195235864 to 195255288 (+0%)
packages/core2-32-poky-linux/mesa/mesa-dbg: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-dev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-doc: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-doc: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-locale: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-locale: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-megadriver: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGSIZE changed from 30549591 to 30553866 (+0%)
packages/core2-32-poky-linux/mesa/mesa-megadriver: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-src: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-src: PKGSIZE changed from 96731905 to 96736085 (+0%)
packages/core2-32-poky-linux/mesa/mesa-src: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-staticdev: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-staticdev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-vdpau-drivers: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa-vulkan-drivers: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/core2-32-poky-linux/mesa/mesa: PV changed from "21.1.3" to "21.1.4"
packages/core2-32-poky-linux/mesa/mesa: PKGV changed from 21.1.3 [default] to 21.1.4 [default]

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 59 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a9a15a17790c28b9696bb4732b987375630c3519"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a9a15a17790c28b9696bb4732b987375630c3519"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 1 Network 0 Missed 56 Current 759 (1% match, 93% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1597 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1645 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1696 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1697 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1698 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1699 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_fetch)
NOTE: Running task 1700 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1782 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: Running task 1825 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1866 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1867 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1868 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1869 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1909 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1936 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1957 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1979 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1980 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1981 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1982 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Succeeded
NOTE: Running task 2010 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_unpack)
NOTE: Running task 2011 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: Running task 2041 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Succeeded
NOTE: Running task 2107 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Started
NOTE: Running task 2307 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2323 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2336 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 2360 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 2361 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2363 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2364 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2365 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2370 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2371 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2373 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2374 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2375 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: Running task 2376 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2378 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c09116e7a1e8cc0003c5ccd8abf3676ec7278c816ea4ad3658e5deaf863ed6b0
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2442 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2443 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c3897072e47f6d6d935d3e001c5f541b493bc22b501b840eee7f9271b7ef5da
NOTE: Setscene tasks completed
NOTE: Running task 2480 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic unihash changed to 3234434785a17a813cca01428e77f2db72a7ae18a18a3989ddf5761cc44d0fbf
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_install)
NOTE: recipe libdrm-2.4.106-r0: task do_install: Started
NOTE: recipe libdrm-2.4.106-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package)
NOTE: Running task 2491 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Started
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 2498 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2501 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2503 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2505 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2506 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2509 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2510 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: Running task 2511 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2513 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: Running task 2514 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2515 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2516 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2519 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2520 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2521 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2523 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2524 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2525 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: Running task 2527 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: Running task 2529 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2531 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2534 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2535 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2536 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: Running task 2537 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2538 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2543 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2546 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: Running task 2547 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2548 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 2555 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 2556 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2557 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: Running task 2558 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_qa)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2559 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2559 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7773808223378456213==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mesa-upgrade-21.1.3-21.1.4.patch"

From c956700a6cf3617fbc9289d34882fcf32b009579 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 08:20:34 +0000
Subject: [PATCH] mesa: upgrade 21.1.3 -> 21.1.4

---
 meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.3.bb => mesa_21.1.4.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa_21.1.3.bb => mesa_21.1.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b7e42a9d7f..6a102585a1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "cbe221282670875ffd762247b6a2c95dcee91d0a34c29802c75ef761fc891e69"
+SRC_URI[sha256sum] = "1f177f44098164b65731c5ded4c928fd58b14f6c9d2087aa0e37bc79bf79e90b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.3.bb b/meta/recipes-graphics/mesa/mesa_21.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.4.bb
-- 
2.20.1


--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a9a15a17790c28b9696bb4732b987375630c3519"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a9a15a17790c28b9696bb4732b987375630c3519"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 57 Local 1 Network 0 Missed 56 Current 759 (1% match, 93% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1185 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1597 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1644 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1696 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1697 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1698 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1699 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_fetch)
NOTE: Running task 1700 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: Running task 1782 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_write_config)
NOTE: Running task 1841 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1842 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1843 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1844 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1872 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1873 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 1897 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1932 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1933 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1934 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Succeeded
NOTE: Running task 1935 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1936 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_unpack)
NOTE: Running task 1937 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1938 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 2034 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: Running task 2042 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2228 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: Running task 2229 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 2357 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2358 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2359 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: Running task 2360 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: Running task 2361 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2363 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 2364 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 2365 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2366 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 2367 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 2368 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2370 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2371 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2372 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2373 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: Running task 2374 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2375 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2376 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2377 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2378 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_configure)
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3e251490b4856b027ccf647cafe5bcc7e717e68661535dffb34ae7a9b90d9d
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2442 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2443 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ea1145b4f943f25b076d01d1d934f51638dc21cf187d96770689ad7c38234ce6
NOTE: Setscene tasks completed
NOTE: Running task 2481 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 2486 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic unihash changed to 3234434785a17a813cca01428e77f2db72a7ae18a18a3989ddf5761cc44d0fbf
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_install)
NOTE: recipe libdrm-2.4.106-r0: task do_install: Started
NOTE: recipe libdrm-2.4.106-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package)
NOTE: Running task 2491 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Started
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2494 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2496 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2498 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2501 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: Running task 2503 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2504 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: Running task 2505 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2506 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2507 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2509 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2511 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2513 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2514 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2515 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2516 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2517 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2518 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2519 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2520 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2521 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2522 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2523 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2524 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2525 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2526 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: Running task 2527 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2528 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2531 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2532 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2533 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2534 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2535 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2536 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: Running task 2537 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2538 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2540 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2541 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2542 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2543 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2544 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2545 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2546 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: Running task 2547 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2548 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 2554 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 2555 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 2556 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2557 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: Running task 2558 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_qa)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2559 of 2559 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2559 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7773808223378456213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 41 skipped, 0 masked, 0 errors.
Removing 116 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a9a15a17790c28b9696bb4732b987375630c3519"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a9a15a17790c28b9696bb4732b987375630c3519"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 603 Local 546 Network 0 Missed 57 Current 224 (90% match, 93% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 225 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 283 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 285 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 289 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 291 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 292 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 298 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 331 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 363 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 367 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 368 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 369 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 373 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 376 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 378 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 380 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 383 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 384 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 386 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 388 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 391 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 392 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 393 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 395 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 396 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 397 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 398 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 402 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 403 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 404 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 408 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 409 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 418 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 428 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 435 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 438 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 443 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 449 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Started
NOTE: Running task 760 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 761 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running setscene task 474 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 774 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: Running task 790 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running setscene task 479 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 809 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_fetch)
NOTE: Running task 810 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 811 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 812 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 813 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 838 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_fetch)
NOTE: Running task 849 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_write_config)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 960 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1068 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1069 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_fetch: Succeeded
NOTE: Running task 1080 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: Running task 1081 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: Running task 1082 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1083 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1095 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1096 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Started
NOTE: Running task 1121 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: Running task 1123 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1124 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1133 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1134 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1135 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: Running task 1140 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_patch)
NOTE: Running task 1141 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1142 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1157 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 524 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1162 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch)
NOTE: Running task 1163 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1164 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1167 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1171 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_patch)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1251 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1252 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_lic unihash changed to 3234434785a17a813cca01428e77f2db72a7ae18a18a3989ddf5761cc44d0fbf
NOTE: recipe mesa-2_21.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 610 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1288 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1295 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1296 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 656 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 658 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1338 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 687 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 1345 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1358 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 698 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 707 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1363 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 712 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 729 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 737 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 740 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1398 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 751 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 754 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 755 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 772 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 774 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 777 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 782 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1459 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ddb7cbb05a3514a911d134efaf88f6ddf4f53f8f4619ab94e3a7e28d32b32581
NOTE: Running task 1468 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 795 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 798 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 803 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 822 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 827 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2071 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2080 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2117 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2183 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2504 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: Running task 2506 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2507 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libdrm-2.4.106-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2508 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.106-r0: task do_configure: Succeeded
NOTE: Running task 2509 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_compile)
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_install)
NOTE: recipe libdrm-2.4.106-r0: task do_install: Started
NOTE: recipe libdrm-2.4.106-r0: task do_install: Succeeded
NOTE: Running task 2511 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package)
NOTE: Running task 2512 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package: Started
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package: Succeeded
NOTE: Running task 2513 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Started
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
ERROR: libdrm-2.4.106-r0 do_packagedata: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.107-r0 to 0:2.4.106-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata: Succeeded
NOTE: Running task 2514 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm)
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2515 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: Running task 2516 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2517 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2519 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2520 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 2521 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 2522 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2523 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2524 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2525 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: Running task 2526 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2527 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2528 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2531 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2533 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2534 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2535 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2536 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2537 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2538 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2539 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2540 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2541 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 2542 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2543 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2544 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 2545 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 2546 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2547 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: Running task 2548 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2549 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 2550 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2551 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2552 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 2553 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2554 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 2555 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 2556 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 2557 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2558 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2559 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2560 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 2561 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 2562 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2563 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2564 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2565 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2566 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 2567 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: Running task 2568 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2569 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2570 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_configure)
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 2571 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2572 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_configure: Succeeded
NOTE: Running task 2573 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_compile)
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_compile: Succeeded
NOTE: Running task 2574 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_install)
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_install: Succeeded
NOTE: Running task 2575 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package)
NOTE: Running task 2576 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_populate_sysroot)
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package: Succeeded
NOTE: Running task 2577 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2578 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_write_rpm)
NOTE: Running task 2579 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_package_qa)
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Started
NOTE: recipe mesa-2_21.1.4-r0: task do_package_qa: Succeeded
NOTE: recipe mesa-2_21.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2580 of 2580 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2580 tasks of which 2445 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7773808223378456213==--
