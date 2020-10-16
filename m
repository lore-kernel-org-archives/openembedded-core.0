Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12526.1602843683674856204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 31A9238C17BA
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.66.1 FAILED
Message-ID: <MADEUP.163E71D6EAC52FDA.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143466
Content-Type: multipart/mixed; boundary="===============2900129572461101737=="

--===============2900129572461101737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.66.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.64.1-1.66.1.patch
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

--===============2900129572461101737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1444 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1a29c1f853290a7217240adb675f765114ddd85e"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 222 Found 208 Missed 14 Current 490 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 555 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_setscene)
NOTE: Running setscene task 560 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 673 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 675 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 677 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1016 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1026 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_fetch)
NOTE: Running task 1121 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1132 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_write_config)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_setscene: Succeeded
NOTE: Running task 1144 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_fetch)
NOTE: Running setscene task 678 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Started
NOTE: Running task 1285 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_write_config)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 1363 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: Running task 1364 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_unpack)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 680 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_fetch: Succeeded
NOTE: Running task 1367 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_unpack)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_write_config: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 682 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 691 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 1398 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_unpack: Succeeded
NOTE: Running task 1399 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 693 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 700 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 701 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1411 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1424 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1425 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 705 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 706 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_patch: Succeeded
NOTE: Running task 1454 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 712 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1994 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_configure: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_configure: Succeeded
NOTE: Running task 2215 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_compile)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_compile: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_compile: Succeeded
NOTE: Running task 2216 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_install)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_install: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_install: Succeeded
NOTE: Running task 2217 of 2235 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-native-1.66.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2218 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2219 of 2235 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Started
ERROR: gobject-introspection-1.66.1-r0 do_configure: QA Issue: gobject-introspection: configure was passed unrecognised options: gi_cross_use_host_gi [unknown-configure-option]
ERROR: gobject-introspection-1.66.1-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gobject-introspection/1.66.1-r0/temp/log.do_configure.2233664
NOTE: recipe gobject-introspection-1.66.1-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2219 tasks of which 2197 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============2900129572461101737==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.64.1-1.66.1.patch"

From c9b5b1a2565a9b9273f093fbe4061fb187c5c488 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:07:21 +0000
Subject: [PATCH] gobject-introspection: upgrade 1.64.1 -> 1.66.1

---
 ...pository-directory-for-native-builds.patch |  2 +-
 ...ency-for-g-ir-compiler-for-building-.patch | 33 -------------------
 ...4.1.bb => gobject-introspection_1.66.1.bb} |  4 +--
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.64.1.bb => gobject-introspection_1.66.1.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 9d6f5dea3c..7eb868c45e 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 8dfb44450ca9fffc15977e95eadcb7054ab60a9a Mon Sep 17 00:00:00 2001
+From 4e1ccef87b2b97e7f563a195fc4551eabbd27645 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
deleted file mode 100644
index fc37a5bb96..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 56ba5656258b82dbc069ab3a61e597c931a16a83 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 17 Jun 2020 11:43:16 +0200
-Subject: [PATCH] gir: add a dependency for g-ir-compiler for building .girs
-
-meson inserts the dependency if the compiler is used directly, but
-fails to do so if the compiler is run through a wrapper. This leads
-to build race errors between building the compiler and using it.
-
-Fix provided by Quentin Schulz <quentin.schulz@streamunlimited.com>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gir/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gir/meson.build b/gir/meson.build
-index b37fdb81..557e5517 100644
---- a/gir/meson.build
-+++ b/gir/meson.build
-@@ -448,7 +448,7 @@ foreach gir : gir_files
-   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
-     input: gir,
-     output: '@BASENAME@.typelib',
--    depends: [gobject_gir, ],
-+    depends: [gobject_gir, gircompiler, ],
-     command: gircompiler_command,
-     install: true,
-     install_dir: typelibdir,
--- 
-2.27.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index 4d80f00e10..30f708ef6d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -15,11 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch \
            "
 
-SRC_URI[md5sum] = "3419dfd086efcf83768e0579ab6abd2b"
-SRC_URI[sha256sum] = "80beae6728c134521926affff9b2e97125749b38d38744dc901f4010ee3e7fa7"
+SRC_URI[sha256sum] = "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.18.4


--===============2900129572461101737==--
