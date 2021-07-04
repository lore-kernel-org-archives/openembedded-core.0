Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7617.1625391858605735616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id D4A9438C126E
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.48.7 SUCCEEDED
Message-ID: <MADEUP.168E8D48AD18C0BD.2482@lists.openembedded.org>
X-Groupsio-MsgNum: 153528
Content-Type: multipart/mixed; boundary="===============3691134586793021732=="

--===============3691134586793021732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.48.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.48.5-1.48.7.patch
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

--===============3691134586793021732==
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
DISTRO_VERSION       = "3.3+snapshot-55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 2 Network 0 Missed 66 Current 817 (2% match, 92% complete)
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 831 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1190 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1349 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1369 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1405 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1499 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1500 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_fetch)
NOTE: Running task 1522 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1523 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1598 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: Running task 1673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: Running task 1674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1739 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1757 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1768 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1792 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1793 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_write_config)
NOTE: Running task 1800 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1846 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: Running task 1847 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1873 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1880 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1881 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1896 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: Running task 1916 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1917 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: Running task 1930 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1931 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1945 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1946 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1947 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1948 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1963 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2124 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 2197 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2306 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2513 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: Running task 2534 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2535 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2537 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2538 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2539 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2540 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: Running task 2541 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2543 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2544 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: Running task 2545 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2546 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2547 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2548 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2549 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Started
NOTE: Running task 2550 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic unihash changed to eddf9c53c29cc9bef4cc88ef6bbc538fa4357155518ef6fe96333b5015dac862
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3ac43696b851485adafba19a643f135a128833e98a29f0334cd75440e1a4e9
NOTE: Running task 2576 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2616 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2617 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2619 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b169c09b3341afe1cc48221181569c738481714a299e3f58e326f2a67a108e3b
NOTE: Setscene tasks completed
NOTE: Running task 2654 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2662 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2664 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2666 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2667 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2668 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2669 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2671 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2672 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2676 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2677 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2678 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2679 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2680 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2681 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2682 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_compile)
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2683 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2684 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 2685 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2686 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2687 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2688 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2689 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2691 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2692 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2696 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2697 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2698 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2702 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2704 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2705 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2706 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Succeeded
NOTE: Running task 2707 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_populate_sysroot)
NOTE: Running task 2708 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package)
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Succeeded
NOTE: Running task 2709 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 2710 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2711 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2712 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 2713 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 2714 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2715 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2717 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2718 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2719 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2720 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2721 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2723 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2726 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2727 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2729 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2730 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2736 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2737 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2739 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2745 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 2747 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2748 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2750 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2752 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 2753 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2754 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: Running task 2755 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 2756 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2757 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: Running task 2758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_qa)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2759 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2759 tasks of which 2597 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============3691134586793021732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1457 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (817 cached, 1 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 69 Local 3 Network 0 Missed 66 Current 816 (4% match, 92% complete)
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 824 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 874 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: Running task 1190 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1349 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1369 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1405 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1499 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_fetch)
NOTE: Running task 1500 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1522 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1523 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1598 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1741 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1742 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1743 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1792 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_write_config)
NOTE: Running task 1793 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1800 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1826 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Started
NOTE: Running task 1827 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1850 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: Running task 1861 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1862 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_unpack)
NOTE: Running task 1863 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1882 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1883 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1884 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1885 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1886 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1895 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1896 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: Running task 1897 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1904 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: Running task 2077 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: Running task 2091 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 2252 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2534 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2535 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2537 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2538 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: Running task 2539 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2540 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2541 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 2542 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: Running task 2543 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2544 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2545 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2546 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: Running task 2547 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2548 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2549 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2550 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to db6c413a4896ec7bf862364677c4dcbd28a03d4718a5b45cc6aa9fa6ae3d9b25
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic unihash changed to eddf9c53c29cc9bef4cc88ef6bbc538fa4357155518ef6fe96333b5015dac862
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2576 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2616 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2617 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5d4d3efc78424bd89260522c7c76ae2f5d48c022ed0e373ad4d4dd9b6e8201dd
NOTE: Setscene tasks completed
NOTE: Running task 2653 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2661 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2662 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2664 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2666 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2667 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2669 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2671 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2672 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2676 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2677 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2679 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2680 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 2681 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2682 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2683 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2684 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2685 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2686 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2687 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2688 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2689 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2691 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2692 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2696 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2697 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2698 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2702 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2704 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2705 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 2706 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2707 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 2708 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 2709 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2710 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2711 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2712 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 2713 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2714 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2715 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2716 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2717 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2719 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2720 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2721 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2722 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2723 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2725 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2726 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Succeeded
NOTE: Running task 2727 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_populate_sysroot)
NOTE: Running task 2728 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package)
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2729 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2730 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2736 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2737 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2739 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2745 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 2747 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2748 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2750 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2752 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 2753 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2754 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: Running task 2755 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 2756 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2757 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: Running task 2758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_qa)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2759 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2759 tasks of which 2597 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============3691134586793021732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.5.tar.xz;name=archive file://run-ptest" to "https://ftp.gnome.org/pub/GNOME/sources/pango/1.48/pango-1.48.7.tar.xz;name=archive file://run-ptest"
packages/core2-32-poky-linux/pango: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 1862528 to 2038324 (+9%)
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-dev: PKGSIZE changed from 1435647 to 1431382 (-0%)
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-ptest: PKGSIZE changed from 1293446 to 1422930 (+10%)
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 1861235 to 1900284 (+2%)
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-src: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango: PKGSIZE changed from 708799 to 722695 (+2%)
packages/core2-32-poky-linux/pango/pango: PV changed from "1.48.5" to "1.48.7"
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.48.5 [default] to 1.48.7 [default]
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpangocairo-1.0.so.0.4800.7 /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.5 to libpango-1.0.so.0.4800.7
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.5 to libpangocairo-1.0.so.0.4800.7
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.5 to libpangoft2-1.0.so.0.4800.7
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.5 to libpangoxft-1.0.so.0.4800.7
  /usr/lib/libpango-1.0.so.0.4800.5 moved to /usr/lib/libpango-1.0.so.0.4800.7
  /usr/lib/libpangocairo-1.0.so.0.4800.5 moved to /usr/lib/libpangocairo-1.0.so.0.4800.7
  /usr/lib/libpangoft2-1.0.so.0.4800.5 moved to /usr/lib/libpangoft2-1.0.so.0.4800.7
  /usr/lib/libpangoxft-1.0.so.0.4800.5 moved to /usr/lib/libpangoxft-1.0.so.0.4800.7

--===============3691134586793021732==
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
DISTRO_VERSION       = "3.3+snapshot-55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 2 Network 0 Missed 66 Current 817 (2% match, 92% complete)
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 831 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1349 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1369 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1405 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1499 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1500 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_fetch)
NOTE: Running task 1522 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1523 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1598 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: Running task 1673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 1675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1754 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 1755 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1756 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1770 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1771 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1792 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1793 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_write_config)
NOTE: Running task 1800 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1846 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1847 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1867 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1879 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1880 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 1882 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1896 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1914 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_unpack)
NOTE: Running task 1915 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1924 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1925 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1944 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: Running task 1945 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1946 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1947 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2106 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 2141 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2435 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2533 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 2534 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 2535 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2537 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2538 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: Running task 2539 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 2540 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2541 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2543 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2544 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2545 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: Running task 2547 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2548 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2549 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2550 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic unihash changed to eddf9c53c29cc9bef4cc88ef6bbc538fa4357155518ef6fe96333b5015dac862
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c09116e7a1e8cc0003c5ccd8abf3676ec7278c816ea4ad3658e5deaf863ed6b0
NOTE: Running task 2576 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2616 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2617 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2619 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8c3897072e47f6d6d935d3e001c5f541b493bc22b501b840eee7f9271b7ef5da
NOTE: Setscene tasks completed
NOTE: Running task 2654 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2662 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 2663 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2664 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2666 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2667 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2669 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2671 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2672 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2676 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2677 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2678 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2679 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2680 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2681 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2682 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2683 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2684 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 2685 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2686 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2687 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2688 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2689 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2691 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2692 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2696 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2697 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2698 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2702 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2704 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2705 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2706 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Succeeded
NOTE: Running task 2707 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_populate_sysroot)
NOTE: Running task 2708 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package)
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Succeeded
NOTE: Running task 2709 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2710 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 2711 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2712 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 2713 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 2714 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2715 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2718 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2719 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2720 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2721 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2723 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2726 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2727 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2729 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2730 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2736 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2737 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2739 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2745 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 2747 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2748 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2750 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2752 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 2753 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2754 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: Running task 2755 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 2756 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2757 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: Running task 2758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_qa)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2759 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2759 tasks of which 2597 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============3691134586793021732==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.48.5-1.48.7.patch"

From 8d8b806a97a9e01266bb3c879aa12bf6c0de2520 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 4 Jul 2021 08:40:34 +0000
Subject: [PATCH] pango: upgrade 1.48.5 -> 1.48.7

---
 .../recipes-graphics/pango/{pango_1.48.5.bb => pango_1.48.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.5.bb => pango_1.48.7.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.5.bb b/meta/recipes-graphics/pango/pango_1.48.7.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.5.bb
rename to meta/recipes-graphics/pango/pango_1.48.7.bb
index b29c3c2d96..963fd5d01c 100644
--- a/meta/recipes-graphics/pango/pango_1.48.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.7.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "501e74496173c02dcd024ded7fbb3f09efd37e2a488e248aa40799424dbb3b2a"
+SRC_URI[archive.sha256sum] = "28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.20.1


--===============3691134586793021732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango-dev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-doc: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-locale: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-ptest: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango-ptest: PKGSIZE changed from 1293446 to 1422930 (+10%)
packages/core2-32-poky-linux/pango/pango-staticdev: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpango-1.0.so.0.4800.5 /usr/lib/libpangocairo-1.0.so.0.4800.5 /usr/lib/libpangoxft-1.0.so.0.4800.5 /usr/lib/libpangoft2-1.0.so.0.4800.5", added "/usr/bin/pango-segmentation /usr/lib/libpango-1.0.so.0.4800.7 /usr/lib/libpangoft2-1.0.so.0.4800.7 /usr/lib/libpangoxft-1.0.so.0.4800.7 /usr/lib/libpangocairo-1.0.so.0.4800.7"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.4800.5 to libpango-1.0.so.0.4800.7
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.4800.5 to libpangocairo-1.0.so.0.4800.7
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.4800.5 to libpangoft2-1.0.so.0.4800.7
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.4800.5 to libpangoxft-1.0.so.0.4800.7
  /usr/lib/libpango-1.0.so.0.4800.5 moved to /usr/lib/libpango-1.0.so.0.4800.7
  /usr/lib/libpangocairo-1.0.so.0.4800.5 moved to /usr/lib/libpangocairo-1.0.so.0.4800.7
  /usr/lib/libpangoft2-1.0.so.0.4800.5 moved to /usr/lib/libpangoft2-1.0.so.0.4800.7
  /usr/lib/libpangoxft-1.0.so.0.4800.5 moved to /usr/lib/libpangoxft-1.0.so.0.4800.7

--===============3691134586793021732==
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
DISTRO_VERSION       = "3.3+snapshot-55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 68 Local 2 Network 0 Missed 66 Current 817 (2% match, 92% complete)
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 831 of 885 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r1: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1191 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1349 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 1369 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1405 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 1499 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_fetch)
NOTE: Running task 1500 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1522 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1523 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: Running task 1598 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 1673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1715 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1716 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: Running task 1723 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 1758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Started
NOTE: Running task 1778 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1793 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_write_config)
NOTE: Running task 1794 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1795 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: Running task 1802 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1826 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: Running task 1827 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1828 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: Running task 1829 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: Running task 1863 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1864 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1865 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1880 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: Running task 1881 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: Running task 1887 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1888 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: Running task 1889 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: Running task 1904 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: Running task 1949 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2082 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 2108 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 2177 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 2533 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: Running task 2534 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2535 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 2536 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2537 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2538 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2539 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2540 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 2541 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2542 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2543 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 2544 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: Running task 2545 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2546 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: Running task 2547 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2548 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2549 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2550 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic unihash changed to eddf9c53c29cc9bef4cc88ef6bbc538fa4357155518ef6fe96333b5015dac862
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 1f3e251490b4856b027ccf647cafe5bcc7e717e68661535dffb34ae7a9b90d9d
NOTE: Running task 2576 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2615 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2616 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2617 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 2618 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 2619 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ea1145b4f943f25b076d01d1d934f51638dc21cf187d96770689ad7c38234ce6
NOTE: Setscene tasks completed
NOTE: Running task 2654 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2662 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2663 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2664 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2665 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: Running task 2666 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 2667 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_configure)
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2669 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2670 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2671 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2672 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2673 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2674 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2675 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2676 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2677 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2678 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2679 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2680 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2681 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2682 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2683 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2684 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 2685 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2686 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2687 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2688 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2689 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2691 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2692 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2696 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2697 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2698 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2699 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2700 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2701 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2702 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2703 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2704 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2705 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2706 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Succeeded
NOTE: Running task 2707 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_populate_sysroot)
NOTE: Running task 2708 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package)
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 2709 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Succeeded
NOTE: Running task 2710 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2711 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2712 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 2713 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 2714 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2715 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 2716 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2717 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2718 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2719 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2720 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2721 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2722 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2723 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2724 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2726 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2727 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2728 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2729 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2730 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2731 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2732 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2733 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2734 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2735 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2736 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2737 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2738 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2739 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2745 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2746 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 2747 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2748 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 2749 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2750 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 2751 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2752 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 2753 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2754 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: Running task 2755 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 2756 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2757 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: Running task 2758 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_qa)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2759 of 2759 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2759 tasks of which 2597 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============3691134586793021732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 818 .bb files complete (0 cached, 818 parsed). 1455 targets, 41 skipped, 0 masked, 0 errors.
Removing 127 recipes from the core2-32 sysroot...done.
Removing 132 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:55d1c47ade5ed83f0b7b59e4c6dbf8696bce7af6"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 658 Local 591 Network 0 Missed 67 Current 238 (89% match, 92% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 239 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 284 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 295 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
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
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 297 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 299 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 301 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 302 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 306 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.12.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 309 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 313 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_package_write_rpm_setscene)
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 342 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 349 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe file-5.40-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 350 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 353 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 354 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.19.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 355 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 356 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 365 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 381 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 382 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libarchive-3.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 383 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 392 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_package_write_rpm_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 393 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.185-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 398 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.12.0.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 399 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 401 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 402 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 410 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 411 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 413 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 414 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_1.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 417 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 419 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 420 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 421 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 423 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_package_write_rpm_setscene)
NOTE: recipe zstd-1.5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 424 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 430 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 431 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 432 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 439 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 440 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 444 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 445 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 447 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 448 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 449 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 450 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 452 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 457 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 459 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 460 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 461 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 462 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 463 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_package_write_rpm_setscene)
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 471 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 473 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 476 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 482 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-1_1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.42-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.9.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcroco-0.6.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 503 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 504 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 509 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 511 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.8.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 514 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe m4-1.4.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 521 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.106-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 524 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.106.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 525 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.185.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 547 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.106-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 748 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 751 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 762 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 786 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 788 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 795 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 796 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_fetch)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 824 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_fetch)
NOTE: recipe e2fsprogs-1.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 864 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 865 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 866 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_fetch)
NOTE: Running task 882 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_fetch)
NOTE: Running task 903 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_write_config)
NOTE: Running task 904 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 905 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_write_config)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 940 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: Running task 941 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_write_config)
NOTE: Running task 948 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running setscene task 573 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 973 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1009 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1067 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe icu-69.1-r0: task do_fetch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe icu-69.1-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1107 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1118 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_unpack)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1119 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe mesa-2_21.1.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_fetch: Started
NOTE: Running task 1121 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_unpack)
NOTE: Running task 1124 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Started
NOTE: recipe pango-1.48.7-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.7-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1163 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_unpack)
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: Running task 1164 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_unpack)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.185-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.7-r0: task do_write_config: Succeeded
NOTE: Running setscene task 583 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Started
NOTE: Running task 1241 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_write_config: Succeeded
NOTE: recipe bison-3.7.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.bb:do_packagedata_setscene)
NOTE: recipe pango-1.48.7-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1250 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1251 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1253 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: Running task 1262 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1263 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1265 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.77.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 613 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.3.bb:do_packagedata_setscene)
NOTE: Running task 1281 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1282 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_patch)
NOTE: Running task 1283 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe pango-1.48.7-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1285 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1286 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_patch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1288 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic)
NOTE: Running task 1289 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-7.77.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gettext-0.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1306 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 632 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.42.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 635 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_lic unihash changed to eddf9c53c29cc9bef4cc88ef6bbc538fa4357155518ef6fe96333b5015dac862
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.48.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcroco-0.6.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1335 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_patch)
NOTE: recipe libidn2-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_patch)
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1350 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_patch)
NOTE: recipe icu-69.1-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 666 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1352 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.68.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_patch: Succeeded
NOTE: Running task 1357 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_make_icudata)
NOTE: Running task 1358 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 669 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-69.1-r0: task do_make_icudata: Started
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1359 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-69.1-r0: task do_make_icudata: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-69.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1380 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_248.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_248.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 710 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1387 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe linux-yocto-5.10.46+gitAUTOINC+b969f83647_139fe7d684-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_248.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 730 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1406 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1407 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 741 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 742 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1442 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 745 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1453 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: Running setscene task 763 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1458 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe expat-2.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1471 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 777 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 795 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 808 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1506 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.36.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 823 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 824 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 825 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 827 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 828 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 829 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 831 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 832 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 833 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 837 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 843 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 846 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1567 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ddb7cbb05a3514a911d134efaf88f6ddf4f53f8f4619ab94e3a7e28d32b32581
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1576 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 867 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 872 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 876 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 878 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 885 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 890 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1919 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2004 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2184 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2185 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2223 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2228 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2581 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe icu-69.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8368b20208632959edfa80648f75d3b19f757661f0268f088a64cfd33dc9d45b
NOTE: Running task 2607 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2616 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2640 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2688 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-69.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2689 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_configure)
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2690 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2691 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2692 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2693 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2694 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2695 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_configure: Succeeded
NOTE: Running task 2696 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2697 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2698 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_configure: Succeeded
NOTE: Running task 2699 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_compile)
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_configure: Succeeded
NOTE: Running task 2700 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2701 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2702 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2703 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2704 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2705 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2706 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2707 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2708 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: Running task 2709 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2710 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2711 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2712 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2713 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.68.0-r0: task do_compile: Succeeded
NOTE: Running task 2714 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_install)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_install: Succeeded
NOTE: Running task 2715 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_populate_sysroot)
NOTE: Running task 2716 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2717 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package: Succeeded
NOTE: Running task 2718 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2719 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb:do_package_write_rpm)
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 2720 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 2721 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 2722 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2723 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2724 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.68.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 2725 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2726 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe icu-69.1-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_install)
NOTE: recipe icu-69.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_install: Succeeded
NOTE: Running task 2728 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_populate_sysroot)
NOTE: Running task 2729 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2730 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe icu-69.1-r0: task do_package: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 2731 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe icu-69.1-r0: task do_package: Succeeded
NOTE: Running task 2732 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_packagedata)
NOTE: recipe icu-69.1-r0: task do_packagedata: Started
NOTE: recipe icu-69.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2733 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_69.1.bb:do_package_write_rpm)
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 2734 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 2735 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2736 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2737 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 2738 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2740 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2741 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe icu-69.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2742 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2743 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2744 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2745 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2746 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_21.1.3-r0: task do_compile: Succeeded
NOTE: Running task 2747 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_install)
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_install: Succeeded
NOTE: Running task 2748 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_populate_sysroot)
NOTE: Running task 2749 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package)
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2750 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2751 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package: Succeeded
NOTE: Running task 2752 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Started
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
ERROR: mesa-2_21.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:21.1.4-r0 to 2:21.1.3-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2753 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.1.3.bb:do_package_write_rpm)
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_21.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2754 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2755 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2756 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 2757 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2758 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2759 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_configure)
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2760 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2761 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2762 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_compile)
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2763 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_install)
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_install: Succeeded
NOTE: Running task 2764 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_populate_sysroot)
NOTE: Running task 2765 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package)
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2766 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2767 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure)
NOTE: recipe pango-1.48.7-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package: Succeeded
NOTE: Running task 2768 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2769 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.1.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_configure: Succeeded
NOTE: Running task 2770 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2771 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile)
NOTE: recipe pango-1.48.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_compile: Succeeded
NOTE: Running task 2772 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2773 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install)
NOTE: recipe pango-1.48.7-r0: task do_install: Started
NOTE: recipe pango-1.48.7-r0: task do_install: Succeeded
NOTE: Running task 2774 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2775 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package)
NOTE: Running task 2776 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_populate_sysroot)
NOTE: recipe pango-1.48.7-r0: task do_package: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package: Succeeded
NOTE: Running task 2777 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_packagedata)
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2778 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_write_rpm)
NOTE: Running task 2779 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_package_qa)
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Started
NOTE: recipe pango-1.48.7-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.48.7-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2780 of 2780 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.7.bb:do_build)
NOTE: Tasks Summary: Attempted 2780 tasks of which 2612 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 28 ERROR messages shown, returning a non-zero exit code.

--===============3691134586793021732==--
