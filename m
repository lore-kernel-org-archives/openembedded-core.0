Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.868.1608060223398260149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5E5DC38C149F
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 5.2.0 FAILED
Message-ID: <MADEUP.1650FA4123B3311A.26179@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6665582872172915244=="

--===============6665582872172915244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *5.2.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake qemu' failed
Loading cache...done.
Loaded 1439 entries from dependency cache.
Parsing recipes...done.
Parsing of 807 .bb files complete (806 cached, 1 parsed). 1413 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-b74073d9e0fdb5bf32085019f77e9b2ca4980604"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b74073d9e0fdb5bf32085019f77e9b2ca4980604"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 599 Found 220 Missed 379 Current 492 (36% match, 65% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 517 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 633 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 810 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 965 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ell-0.33-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ell-0.33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1025 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.33-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 1026 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_packagedata_setscene)
NOTE: recipe ell-0.33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ell-0.33-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1028 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 787 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 788 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 789 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 790 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 795 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_fetch)
NOTE: Running task 799 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: Running task 813 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 815 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 816 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 825 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_fetch)
NOTE: Running task 826 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 827 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 828 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 834 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_fetch)
NOTE: Running task 850 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 859 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 866 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_fetch)
NOTE: Running task 867 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: Running task 868 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: Running task 874 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_fetch)
NOTE: Running task 875 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_fetch)
NOTE: Running task 878 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 881 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 882 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 883 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 884 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 885 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 886 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: Running task 887 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_write_config)
NOTE: Running task 896 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_write_config)
NOTE: Running task 908 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 910 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_fetch)
NOTE: Running task 911 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 916 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_fetch)
NOTE: Running task 929 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: Running task 931 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 933 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: Running task 934 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 935 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 937 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 938 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 948 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 952 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 953 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 954 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: Running task 956 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 957 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 958 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libpng-native-1.6.37-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: Running task 965 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_fetch)
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 966 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Started
NOTE: Running task 975 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 989 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe libical-3.0.8-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_write_config: Succeeded
NOTE: Running task 990 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe libdrm-2.4.103-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 991 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 993 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 994 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 998 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe icu-68.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 999 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1000 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1001 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: Running setscene task 1030 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.55-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe flac-1.3.3-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1031 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 1006 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 1009 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_fetch)
NOTE: Running task 1011 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_fetch)
NOTE: Running task 1014 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1015 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1016 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1017 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1018 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_fetch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1019 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1020 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1021 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 1022 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 1026 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_20.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1027 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1028 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1029 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 1031 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1033 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 1034 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: Running task 1035 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1036 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 1037 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: Running task 1038 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1039 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_unpack)
NOTE: Running task 1051 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1052 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_unpack: Succeeded
NOTE: Running task 1053 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_fetch: Succeeded
NOTE: Running task 1054 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_fetch)
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: Running task 1055 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libical-3.0.8-r0: task do_unpack: Started
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_fetch: Succeeded
NOTE: Running task 1056 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1057 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1058 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libpng-native-1.6.37-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: Running task 1061 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_unpack)
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Started
NOTE: recipe ell-0.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1033 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-native-1.6.37-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1034 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ell/ell_0.33.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1062 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_unpack)
NOTE: recipe flac-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1066 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libpng-native-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libpng-native-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 1068 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libpng-native-1.6.37-r0: task do_patch: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Started
NOTE: Running task 1069 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_unpack)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libpng-native-1.6.37-r0: task do_patch: Succeeded
NOTE: Running task 1070 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: Running task 1071 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_patch: Succeeded
NOTE: Running task 1072 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1073 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 1074 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_fetch: Succeeded
NOTE: Running task 1079 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_unpack)
NOTE: recipe ell-0.33-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1080 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_fetch)
NOTE: Running task 1090 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_fetch)
NOTE: recipe libpng-native-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1091 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_fetch)
NOTE: recipe libical-3.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1093 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe flac-1.3.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpng-native-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_unpack: Started
NOTE: recipe libpng-native-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1038 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-native-2.10.4-r0: task do_fetch: Started
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Started
NOTE: recipe libical-3.0.8-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1039 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1040 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running task 1094 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1095 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1096 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1097 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1098 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libsndfile1-1.0.28-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1099 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_fetch: Succeeded
NOTE: recipe freetype-native-2.10.4-r0: task do_fetch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_fetch: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1104 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_patch)
NOTE: Running task 1105 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_patch)
NOTE: Running task 1106 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_fetch)
NOTE: Running task 1107 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_fetch)
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1115 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_unpack)
NOTE: Running task 1117 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 1118 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-native-1.6.37-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Started
NOTE: recipe sbc-1.4-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Started
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1041 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 1042 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1119 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1121 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1124 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1132 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1137 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1044 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pulseaudio-14.0-r0: task do_fetch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1045 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1138 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_unpack)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1046 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1047 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1048 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_246.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1049 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1050 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1051 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1052 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running task 1141 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1142 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1143 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe icu-68.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1055 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1145 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-1.4-r0: task do_fetch: Succeeded
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 14649561835112b0bd6ce3a7cda0ccf0bbd7e7cedb485e515498145e72106b0d. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: Running task 1146 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1151 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 1152 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: Running task 1153 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 1158 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1160 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1161 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_fetch)
NOTE: recipe flac-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1162 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_patch)
NOTE: Running task 1163 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_unpack)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1164 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1167 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_unpack)
NOTE: recipe libogg-1.3.4-r0: task do_patch: Started
NOTE: Running task 1168 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: Running task 1174 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe freetype-2.10.4-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1056 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_246.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-1.31-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1058 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: recipe sbc-1.4-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.3.3-r0: task do_patch: Started
NOTE: recipe bluez5-5.55-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-native-2.13.1-r0: task do_fetch: Started
NOTE: Running setscene task 1060 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1061 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1063 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1064 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_patch: Succeeded
NOTE: Running setscene task 1065 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1066 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1067 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: Running task 1180 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe freetype-native-2.10.4-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe icu-68.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1181 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_fetch: Succeeded
NOTE: Running task 1187 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 1188 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1190 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1191 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1192 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1193 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1194 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdaemon-0.14-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_unpack)
NOTE: Running task 1196 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_unpack)
ERROR: When reparsing /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install, the basehash value changed from 5e57beda894f9d6537637ff9b47affb2042184f326bbafc75870c336dfbe23cf to 14649561835112b0bd6ce3a7cda0ccf0bbd7e7cedb485e515498145e72106b0d. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake base-files -cdo_install -Snone
ERROR: Then:
ERROR: $ bitbake base-files -cdo_install -Sprintdiff

NOTE: Running task 1197 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_fetch)
NOTE: Running task 1198 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1199 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1200 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-1.31-r0: task do_unpack: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1229 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1230 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1231 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1245 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1247 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_fetch)
NOTE: Running task 1250 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_unpack)
NOTE: Running task 1261 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_unpack)
NOTE: Running task 1264 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1278 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe dtc-1.6.0-r0: task do_fetch: Started
NOTE: Running task 1283 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1284 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: recipe libsdl2-2.0.12-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1068 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running setscene task 1069 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1070 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1071 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1072 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1073 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1074 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1075 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_fetch: Started
NOTE: Running setscene task 1076 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1077 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1286 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1288 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_patch)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1289 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_patch)
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1290 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1291 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1292 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_unpack)
NOTE: recipe bluez5-5.55-r0: task do_patch: Succeeded
NOTE: Running task 1294 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1295 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1296 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1078 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1304 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_fetch)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Started
NOTE: Running task 1322 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1079 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1329 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running setscene task 1080 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1334 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe dtc-1.6.0-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_fetch: Succeeded
NOTE: recipe freetype-native-2.10.4-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1339 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_write_config)
NOTE: recipe sbc-1.4-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1340 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_unpack: Started
NOTE: Running setscene task 1081 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1082 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1083 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1341 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_unpack)
NOTE: recipe speexdsp-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1342 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_unpack)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_patch: Started
NOTE: Running task 1343 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1352 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1359 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_fetch)
NOTE: Running task 1366 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_patch)
NOTE: Running task 1374 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1375 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_fetch: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1380 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 1381 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: recipe cairo-native-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1382 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_fetch: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1383 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe dtc-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_write_config: Started
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1384 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe freetype-native-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe sbc-1.4-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1385 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1386 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-native-2.13.1-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1407 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: Running task 1408 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_fetch)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_write_config: Succeeded
NOTE: recipe libxi-native-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1416 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_fetch)
NOTE: recipe sbc-1.4-r0: task do_patch: Succeeded
NOTE: Running task 1421 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1424 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-native-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_patch: Succeeded
NOTE: recipe atk-native-2.36.0-r0: task do_fetch: Started
NOTE: recipe libtool-2.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-native-1.0.10-r0: task do_fetch: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_fetch: Started
NOTE: Running task 1433 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-native-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 1434 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1436 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1445 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: Running task 1446 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_fetch)
NOTE: Running task 1447 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe fribidi-native-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-native-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe freetype-native-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1448 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1453 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1454 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_unpack: Started
NOTE: Running setscene task 1086 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1087 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.55-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1088 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ofono-1.31-r0: task do_unpack: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_fetch: Started
NOTE: Running setscene task 1089 of 1091 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-native-1.12.20-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-native-1.48.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-native-2.36.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1456 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_patch)
NOTE: recipe pango-native-1.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1457 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxft-native-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 1459 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe speexdsp-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-native-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1460 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: recipe freetype-native-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1461 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_fetch)
NOTE: Running task 1463 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_fetch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1464 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1465 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_fetch)
NOTE: Running task 1466 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-glib-native-0.110-r0: task do_fetch: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1468 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 1470 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1471 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-native-2.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-native-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1477 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 1478 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_unpack)
NOTE: Running task 1481 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_fetch)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-native-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: Running task 1487 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 1488 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ofono-1.31-r0: task do_patch: Started
NOTE: Running setscene task 1090 of 1091 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-native-1.48.0-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-native-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1489 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_write_config)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_unpack: Started
NOTE: Running task 1490 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_patch)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 1491 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 1492 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_fetch: Succeeded
NOTE: Running task 1493 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Started
NOTE: Running task 1494 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_fetch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1495 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_fetch)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-native-3.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_unpack: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxi-native-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 1496 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe libsndfile1-1.0.28-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_patch: Started
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Started
NOTE: recipe atk-native-2.36.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Started
NOTE: recipe ofono-1.31-r0: task do_patch: Succeeded
NOTE: Running task 1635 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 1636 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-native-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1642 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: Running task 1643 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1644 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-native-1.0.10-r0: task do_patch: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_unpack: Succeeded
NOTE: Running task 1660 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1666 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1667 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_deploy_source_date_epoch)
NOTE: Running task 1668 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-native-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1700 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1703 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_fetch: Started
NOTE: Running task 1704 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_unpack: Succeeded
NOTE: Running task 1705 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_patch: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1706 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_patch)
NOTE: recipe pulseaudio-14.0-r0: task do_patch: Succeeded
NOTE: Running task 1707 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1708 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_unpack)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1720 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_fetch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1727 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1733 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: Running task 1746 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Started
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_unpack: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1747 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_patch)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_patch: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_fetch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_patch: Succeeded
NOTE: Running task 1749 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libice-native-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libsm-native-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1750 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 1751 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1752 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1755 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1756 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1757 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe pango-native-1.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 1758 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_unpack: Started
NOTE: recipe dtc-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1759 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-native-2.36.0-r0: task do_write_config: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ofono-1.31-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1760 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_fetch)
NOTE: Running task 1761 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_fetch)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_patch: Started
NOTE: recipe atk-native-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 1762 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_fetch)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_patch: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1763 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_fetch)
NOTE: recipe pango-native-1.48.0-r0: task do_patch: Started
NOTE: recipe atk-native-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-native-1.48.0-r0: task do_patch: Succeeded
NOTE: Running task 1764 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_fetch)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_fetch)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1780 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_fetch)
NOTE: recipe atk-native-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1781 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_fetch)
NOTE: Running task 1786 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_fetch)
NOTE: recipe libcroco-native-0.6.13-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 1787 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_fetch)
NOTE: recipe dbus-native-1.12.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-glib-native-0.110-r0: task do_patch: Succeeded
NOTE: Running task 1790 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1791 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1794 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1795 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_fetch: Started
NOTE: Running task 1796 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1797 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-native-1.0.10-r0: task do_write_config: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_patch: Succeeded
NOTE: Running task 1798 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_write_config: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_patch: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-native-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 1799 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_configure)
NOTE: recipe alsa-lib-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1800 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_configure)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1801 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Started
NOTE: recipe libdaemon-0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1802 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 1803 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1804 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_configure)
NOTE: Running task 1805 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_configure)
NOTE: Running task 1806 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: Running task 1810 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.4-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Started
NOTE: Running task 1811 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_unpack)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1812 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_fetch: Succeeded
NOTE: Running task 1813 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1814 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_unpack)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-native-1.48.0-r0: task do_write_config: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1829 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Started
NOTE: recipe pango-native-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1831 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_configure)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1847 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_unpack)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1852 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_unpack)
NOTE: recipe cantarell-fonts-0.201-r0: task do_fetch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_fetch: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_fetch: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_fetch: Succeeded
NOTE: Running task 1853 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_unpack)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe pango-native-1.48.0-r0: task do_write_config: Succeeded
NOTE: Running task 1868 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_unpack)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libcroco-native-0.6.13-r0: task do_unpack: Started
NOTE: Running task 1873 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_unpack)
NOTE: Running task 1874 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_unpack)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_unpack: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Started
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_patch: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-native-2.40.21-r0: task do_unpack: Started
NOTE: Running task 1893 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_patch)
NOTE: Running task 1894 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_patch)
NOTE: recipe alsa-state-0.2.0-r5: task do_unpack: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_unpack: Succeeded
NOTE: Running task 1895 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_patch)
NOTE: Running task 1896 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_patch)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_unpack)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_patch)
NOTE: recipe dbus-native-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1901 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_unpack)
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_patch: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_patch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1902 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_patch)
NOTE: recipe libtool-2.4.6-r0: task do_patch: Succeeded
NOTE: Running task 1903 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe consolekit-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 1904 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_unpack)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Started
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Started
NOTE: Running task 1905 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-native-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1906 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_fetch: Succeeded
NOTE: Running task 1907 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_unpack)
NOTE: recipe dbus-native-1.12.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_unpack: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe libsdl2-2.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_patch)
NOTE: recipe dbus-glib-0.110-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-native-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_unpack: Succeeded
NOTE: Running task 1911 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_patch)
NOTE: recipe gtk+3-3.24.23-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-native-3.24.23-r0: task do_fetch: Succeeded
NOTE: Running task 1912 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_unpack)
NOTE: Running task 1913 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_unpack)
NOTE: recipe libsdl2-2.0.12-r0: task do_patch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_patch: Started
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_patch: Started
NOTE: Running task 1914 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-glib-native-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-native-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-native-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-native-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-native-1.12.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1919 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_configure)
NOTE: Running task 1920 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: Running task 1921 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_configure)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1923 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1925 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: recipe cantarell-fonts-0.201-r0: task do_fetch: Succeeded
NOTE: Running task 1926 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1927 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 1928 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_unpack)
NOTE: Running task 1931 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1933 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 1934 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1935 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.23-r0: task do_unpack: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_patch: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_unpack: Started
NOTE: recipe libtool-2.4.6-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 1944 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_write_config)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 1945 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1946 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_configure: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_configure: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1967 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_write_config)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 1968 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1969 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_write_config: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2003 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2004 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cantarell-fonts-0.201-r0: task do_write_config: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2070 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_patch)
NOTE: recipe libcroco-native-0.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2071 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_patch)
NOTE: recipe virglrenderer-0.8.2-r0: task do_patch: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_unpack: Succeeded
NOTE: Running task 2072 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_patch)
NOTE: recipe mesa-2_20.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 2073 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_patch)
NOTE: recipe libcroco-native-0.6.13-r0: task do_patch: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2074 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe dtc-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2075 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_patch)
NOTE: recipe mesa-2_20.2.4-r0: task do_patch: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_patch: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2076 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2077 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe dtc-1.6.0-r0: task do_patch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_patch: Succeeded
NOTE: Running task 2078 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_patch: Succeeded
NOTE: Running task 2079 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_patch)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 2081 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_patch)
NOTE: recipe dtc-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2082 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-native-2.40.21-r0: task do_patch: Succeeded
NOTE: Running task 2083 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2084 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libcroco-native-0.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dtc-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe consolekit-0.4.6-r0: task do_patch: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2085 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2086 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2087 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_unpack)
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2088 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2089 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_configure)
NOTE: Running task 2090 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2091 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_configure)
NOTE: recipe dtc-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2092 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_configure: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dtc-1.6.0-r0: task do_configure: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_configure: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe dtc-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 2093 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_compile)
NOTE: Running task 2094 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_compile)
NOTE: Running task 2095 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_compile)
NOTE: recipe dtc-1.6.0-r0: task do_compile: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_compile: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_compile: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_unpack: Succeeded
NOTE: Running task 2096 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_patch)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_compile: Succeeded
NOTE: Running task 2097 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_install)
NOTE: recipe librsvg-native-2.40.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2098 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_patch: Succeeded
NOTE: recipe consolekit-0.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cantarell-fonts-0.201-r0: task do_patch: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_patch: Succeeded
NOTE: Running task 2099 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_deploy_source_date_epoch)
NOTE: recipe libsdl2-2.0.12-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2100 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2101 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2102 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_deploy_source_date_epoch)
NOTE: Running task 2103 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2104 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_configure)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_install: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_install: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2105 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_compile)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_install: Succeeded
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_install: Succeeded
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 2106 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_install)
NOTE: recipe python3-native-3.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1091 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsdl2-2.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cantarell-fonts-0.201-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_install: Started
NOTE: Running task 2107 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_configure)
NOTE: recipe virglrenderer-0.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-native-3.24.23-r0: task do_unpack: Succeeded
NOTE: Running task 2108 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Started
NOTE: Running task 2109 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: Running task 2110 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_install: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_configure: Succeeded
NOTE: Running task 2111 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 2112 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_patch: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_compile: Succeeded
NOTE: Running task 2113 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Started
NOTE: recipe python3-native-3.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Started
NOTE: Running task 2299 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2302 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2313 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_patch: Succeeded
NOTE: Running task 2370 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2389 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-state-0.2.0-r5: task do_install: Succeeded
NOTE: Running task 2408 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2419 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2420 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2423 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2452 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2480 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2522 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: Running task 2538 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2554 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2562 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2576 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2578 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2598 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch)
NOTE: Running task 2599 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2601 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2615 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2616 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2630 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_package)
NOTE: Running task 2632 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package)
NOTE: recipe dtc-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2640 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2643 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_configure)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2656 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_package)
NOTE: recipe libice-native-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2657 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_package)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-native-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2695 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-native-3.24.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package: Started
NOTE: Running task 2696 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2697 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package: Started
NOTE: recipe dtc-1.6.0-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_configure: Succeeded
NOTE: Running task 2794 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_compile: Succeeded
NOTE: Running task 2795 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_install)
NOTE: recipe fribidi-native-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2796 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_install: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_configure: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2797 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_configure)
NOTE: recipe atk-native-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2798 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe dtc-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2799 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_populate_sysroot)
NOTE: Running task 2800 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_package)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-native-2.36.0-r0: task do_configure: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_configure: Started
NOTE: recipe dtc-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe dtc-1.6.0-r0: task do_package: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2801 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_patch)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2802 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2803 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_install: Succeeded
NOTE: Running task 2804 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package)
NOTE: Running task 2805 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_populate_sysroot: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2806 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2807 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-native-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2808 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_configure)
NOTE: recipe cantarell-fonts-0.201-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_configure: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_configure: Succeeded
NOTE: Running task 2809 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_compile)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cantarell-fonts-0.201-r0: task do_compile: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_unpack: Succeeded
NOTE: Running task 2811 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_patch)
NOTE: recipe cantarell-fonts-0.201-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_patch: Succeeded
NOTE: Running task 2812 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_deploy_source_date_epoch)
NOTE: recipe cantarell-fonts-0.201-r0: task do_install: Succeeded
NOTE: Running task 2813 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_package)
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_package: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2814 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe gtk+3-3.24.23-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2815 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe dtc-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-native-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_configure: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2816 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2817 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2818 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_compile: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2819 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-state-0.2.0-r5: task do_package: Succeeded
NOTE: Running task 2820 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_packagedata)
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2821 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_configure)
NOTE: Running task 2822 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: Running task 2823 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_configure: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2824 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2825 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: Running task 2826 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb:do_package_write_rpm)
NOTE: recipe atk-native-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2827 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe alsa-state-0.2.0-r5: task do_packagedata: Succeeded
NOTE: recipe fribidi-native-1.0.10-r0: task do_compile: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe qemu-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2828 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_patch)
NOTE: recipe dtc-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2829 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_packagedata)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package: Succeeded
NOTE: Running task 2830 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata)
NOTE: recipe atk-native-2.36.0-r0: task do_compile: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 2831 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_packagedata)
NOTE: recipe qemu-5.1.0-r0: task do_patch: Started
NOTE: recipe dtc-1.6.0-r0: task do_packagedata: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-topology-conf-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dtc-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2832 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/dtc/dtc_1.6.0.bb:do_package_write_rpm)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata: Succeeded
NOTE: Running task 2833 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2834 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2835 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe cantarell-fonts-0.201-r0: task do_package: Succeeded
NOTE: recipe dtc-1.6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2836 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: Running task 2837 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_packagedata)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_packagedata: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package: Succeeded
NOTE: Running task 2838 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2839 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_packagedata: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2840 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe fribidi-native-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2841 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2842 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_install: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_install: Started
NOTE: recipe atk-native-2.36.0-r0: task do_compile: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: Running task 2843 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe dtc-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2844 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe alsa-ucm-conf-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2845 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: recipe atk-native-2.36.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2846 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_configure: Succeeded
NOTE: Running task 2847 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_compile)
NOTE: recipe qemu-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 2848 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-native-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2849 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_populate_lic)
NOTE: Running task 2850 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Started
NOTE: recipe qemu-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe qemu-5.1.0-r0: task do_populate_lic: Started
NOTE: recipe fribidi-native-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_compile: Succeeded
NOTE: Running task 2851 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_install)
NOTE: recipe qemu-5.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2852 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: recipe qemu-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2853 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-native-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_install: Succeeded
NOTE: Running task 2854 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_populate_sysroot)
NOTE: Running task 2855 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package)
NOTE: recipe fribidi-native-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-native-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2856 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe libpng-native-1.6.37-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2857 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package: Succeeded
NOTE: Running task 2858 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_packagedata)
NOTE: recipe atk-native-2.36.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: Running task 2859 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_configure: Succeeded
NOTE: Running task 2860 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_compile)
NOTE: recipe atk-native-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2861 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2862 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2863 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_packagedata: Succeeded
NOTE: Running task 2864 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-1.6.37-r0: task do_configure: Succeeded
NOTE: Running task 2865 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_compile)
NOTE: recipe atk-native-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2866 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_compile: Succeeded
NOTE: Running task 2867 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_install)
NOTE: recipe mobile-broadband-provider-info-1_20190618-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_install: Succeeded
NOTE: Running task 2868 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_populate_sysroot)
NOTE: Running task 2869 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-native-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2870 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libpng-native-1.6.37-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_configure: Succeeded
NOTE: Running task 2871 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 2872 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2873 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 2874 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_compile)
NOTE: recipe libpng-native-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2875 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Started
NOTE: recipe libpng-native-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2876 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libpng-native-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2877 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2878 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 2879 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe freetype-native-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2880 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe freetype-native-2.10.4-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 2881 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2882 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 2883 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 2884 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libogg-1.3.4-r0: task do_compile: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: Running task 2885 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 2886 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 2887 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libcroco-native-0.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2888 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_compile)
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2889 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package: Succeeded
NOTE: Running task 2890 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 2891 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libdaemon-0.14-r0: task do_configure: Succeeded
NOTE: Running task 2892 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_compile)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Started
NOTE: recipe libpng-1.6.37-r0: task do_compile: Succeeded
NOTE: Running task 2893 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 2894 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 2895 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: Running task 2896 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Started
NOTE: recipe libogg-1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2898 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2899 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 2900 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 2901 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libatomic-ops-7.6.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2902 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb:do_package_write_rpm)
NOTE: recipe libogg-1.3.4-r0: task do_install: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2903 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_install)
NOTE: recipe libdrm-2.4.103-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2904 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_configure)
NOTE: recipe libpng-1.6.37-r0: task do_install: Succeeded
NOTE: Running task 2905 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Started
NOTE: Running task 2906 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Started
NOTE: recipe libdaemon-0.14-r0: task do_compile: Succeeded
NOTE: Running task 2907 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2908 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_package: Started
NOTE: Running task 2909 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_install: Started
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_install)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2912 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libice-native-1_1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2913 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_compile)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_compile: Started
NOTE: recipe libdaemon-0.14-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot)
NOTE: Running task 2915 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package)
NOTE: recipe libogg-1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2916 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2917 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2918 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe speexdsp-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2919 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2920 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package)
NOTE: recipe libdaemon-0.14-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libatomic-ops-7.6.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_install: Succeeded
NOTE: Running task 2921 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: Running task 2923 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package)
NOTE: recipe libcroco-native-0.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_install)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2925 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2926 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2927 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe freetype-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2928 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_configure)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_configure: Started
NOTE: recipe freetype-2.10.4-r0: task do_configure: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe speexdsp-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2929 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2930 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcroco-native-0.6.13-r0: task do_install: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2932 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcroco/libcroco_0.6.13.bb:do_populate_sysroot)
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 2933 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 2937 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe libcroco-native-0.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 2938 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_install: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2942 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2943 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: recipe libice-native-1_1.0.10-r0: task do_install: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 2945 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm)
NOTE: recipe libxi-native-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2946 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot)
NOTE: recipe libcroco-native-0.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 2947 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: Running task 2949 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libice-native-1_1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 2950 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 2951 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxcursor-native-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_install)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_compile: Started
NOTE: recipe libxi-native-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2953 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 2954 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libical-3.0.8-r0: task do_install: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libice-native-1_1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2956 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-native-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-native-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_configure: Succeeded
NOTE: Running task 2957 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_compile)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Started
NOTE: recipe libpng-1.6.37-r0: task do_package: Succeeded
NOTE: Running task 2958 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_install: Succeeded
NOTE: Running task 2959 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_populate_sysroot)
NOTE: Running task 2960 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2961 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Started
NOTE: Running task 2962 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2963 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2964 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2965 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2966 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_configure)
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2967 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2969 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2971 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libtool-2.4.6-r0: task do_install: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata: Succeeded
NOTE: Running task 2972 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: Running task 2973 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2974 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 2975 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libical-3.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libogg-1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2976 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2977 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.4.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libdaemon-0.14-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package: Succeeded
NOTE: Running task 2978 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata)
NOTE: Running task 2979 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Started
NOTE: recipe speexdsp-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2980 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2981 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_package_write_rpm)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2982 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm)
NOTE: Running task 2983 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_install: Succeeded
NOTE: Running task 2984 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_populate_sysroot)
NOTE: Running task 2985 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package)
NOTE: recipe speexdsp-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2986 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtool-2.4.6-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 2987 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libtool-2.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure)
NOTE: recipe libdrm-2.4.103-r0: task do_compile: Succeeded
NOTE: Running task 2989 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2990 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm)
NOTE: recipe speexdsp-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package: Started
NOTE: recipe libical-3.0.8-r0: task do_package: Succeeded
NOTE: Running task 2994 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot: Succeeded
NOTE: recipe freetype-native-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 2995 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe libical-3.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2996 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.8.bb:do_package_write_rpm)
NOTE: recipe freetype-native-2.10.4-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libtool-2.4.6-r0: task do_package: Succeeded
NOTE: Running task 2997 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_packagedata)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_compile)
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 2999 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: recipe libtool-2.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3000 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool_2.4.6.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3001 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_install)
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Started
NOTE: recipe libical-3.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package: Succeeded
NOTE: Running task 3002 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-native-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3003 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_populate_sysroot)
NOTE: recipe freetype-native-2.10.4-r0: task do_compile: Succeeded
NOTE: Running task 3004 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: Running task 3005 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_install)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Started
NOTE: recipe libtool-2.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata: Succeeded
NOTE: Running task 3007 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Started
NOTE: Running task 3010 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: recipe alsa-lib-1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Started
NOTE: recipe freetype-native-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3012 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3013 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package: Succeeded
NOTE: Running task 3016 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 3019 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3020 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3021 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3022 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_compile: Succeeded
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_compile: Started
NOTE: Running task 3024 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3025 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3031 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb:do_package_write_rpm)
NOTE: recipe freetype-2.10.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3034 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3036 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3037 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 3038 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: recipe libsm-native-1_1.2.3-r0: task do_compile: Started
NOTE: Running task 3039 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe freetype-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot)
NOTE: Running task 3041 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3042 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3043 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_package: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: Running task 3044 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3047 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 3048 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: Running task 3050 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3051 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-native-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3052 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3053 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 3054 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: Running task 3055 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libsm-native-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe dbus-native-1.12.20-r0: task do_configure: Succeeded
NOTE: Running task 3058 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 3059 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 3060 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-native-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3061 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_configure: Succeeded
NOTE: Running task 3065 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_configure_ptest_base)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3066 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3067 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3069 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3071 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3072 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-native-1.12.20-r0: task do_compile: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3073 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_install)
NOTE: Running task 3074 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-native-1.12.20-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Started
NOTE: recipe freetype-2.10.4-r0: task do_package: Succeeded
NOTE: Running task 3078 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3079 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3080 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3081 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: Running task 3082 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3083 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3084 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3085 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3086 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3087 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package_write_rpm)
NOTE: recipe dbus-native-1.12.20-r0: task do_install: Succeeded
NOTE: Running task 3088 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3089 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm)
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3090 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe dbus-native-1.12.20-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3091 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe dbus-native-1.12.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3092 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3093 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3094 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-glib-native-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3095 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: Running task 3096 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_configure: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3097 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe flac-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3099 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.55-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3102 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3104 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_compile)
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-native-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3106 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3107 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3108 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-native-2.13.1-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3109 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_install: Succeeded
NOTE: Running task 3110 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot)
NOTE: Running task 3111 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_compile: Started
NOTE: recipe flac-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3113 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3114 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_20.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_install: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3115 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3116 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3117 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-native-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3118 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe flac-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3119 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3120 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.3.3-r0: task do_package: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3121 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_configure)
NOTE: recipe dbus-glib-native-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3122 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe mesa-2_20.2.4-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3123 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3124 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe dbus-glib-native-0.110-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe flac-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3125 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package: Succeeded
NOTE: Running task 3126 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3127 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3128 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3129 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3130 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_compile)
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Started
NOTE: recipe fontconfig-native-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3132 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe dbus-glib-native-0.110-r0: task do_install: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe fontconfig-native-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3135 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3136 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3137 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe cairo-native-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3138 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe flac-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 3139 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Started
NOTE: recipe dbus-glib-native-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3140 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3141 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe flac-1.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3142 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.3.3.bb:do_package_write_rpm)
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3143 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3144 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_configure: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_configure: Started
NOTE: recipe flac-1.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3145 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_configure)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3146 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3147 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_install)
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_install: Succeeded
NOTE: Running task 3148 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot)
NOTE: Running task 3149 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3150 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3151 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3152 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_compile)
NOTE: recipe mesa-2_20.2.4-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3153 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3155 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3156 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3157 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.201.bb:do_package_write_rpm)
NOTE: Running task 3158 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm)
NOTE: Running task 3159 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_package_write_rpm)
NOTE: recipe cantarell-fonts-0.201-r0: task do_package_write_rpm: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm: Started
NOTE: recipe cantarell-fonts-0.201-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3160 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3161 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3162 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3163 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3164 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3165 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3166 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3167 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3168 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3169 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3170 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3171 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe libxft-native-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3172 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3174 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3175 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe libxft-native-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3176 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3177 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3178 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3179 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe dbus-glib-0.110-r0: task do_configure: Succeeded
NOTE: Running task 3180 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_configure: Succeeded
NOTE: Running task 3181 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3182 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3183 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3184 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3185 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.0.28-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_install)
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Started
NOTE: recipe dbus-glib-0.110-r0: task do_compile: Succeeded
NOTE: Running task 3187 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_install)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_install: Succeeded
NOTE: Running task 3188 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot)
NOTE: Running task 3189 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package)
NOTE: recipe dbus-glib-0.110-r0: task do_install: Succeeded
NOTE: Running task 3190 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package)
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Started
NOTE: Running task 3191 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_populate_sysroot)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Started
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3192 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3193 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-glib-0.110-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3194 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3195 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_configure)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3196 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_configure)
NOTE: recipe sbc-1.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3197 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3198 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package: Succeeded
NOTE: Running task 3199 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3200 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_configure)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Started
NOTE: recipe dbus-glib-0.110-r0: task do_packagedata: Succeeded
NOTE: Running task 3201 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-glib_0.110.bb:do_package_write_rpm)
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_package: Succeeded
NOTE: Running task 3202 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_packagedata)
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.0.28-r0: task do_packagedata: Succeeded
NOTE: Running task 3203 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_package_write_rpm)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-glib-0.110-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3204 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe libsndfile1-1.0.28-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_compile: Started
NOTE: recipe sbc-1.4-r0: task do_configure: Succeeded
NOTE: Running task 3205 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_compile)
NOTE: recipe sbc-1.4-r0: task do_compile: Started
NOTE: recipe sbc-1.4-r0: task do_compile: Succeeded
NOTE: Running task 3206 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_install)
NOTE: recipe sbc-1.4-r0: task do_install: Started
NOTE: recipe sbc-1.4-r0: task do_install: Succeeded
NOTE: Running task 3207 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot)
NOTE: Running task 3208 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package)
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-1.4-r0: task do_package: Started
NOTE: recipe sbc-1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-1.4-r0: task do_package: Succeeded
NOTE: Running task 3209 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_packagedata)
NOTE: recipe sbc-1.4-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_configure: Succeeded
NOTE: Running task 3210 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_compile)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3211 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-native-1.16.0-r0: task do_install: Started
NOTE: recipe sbc-1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3212 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_package_write_rpm)
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm: Started
NOTE: recipe sbc-1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-native-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3213 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3214 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-native-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3215 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_compile: Succeeded
NOTE: Running task 3216 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_install)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Started
NOTE: recipe consolekit-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 3217 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_install)
NOTE: recipe consolekit-0.4.6-r0: task do_install: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_install: Succeeded
NOTE: Running task 3218 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package)
NOTE: Running task 3219 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_populate_sysroot)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3220 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_configure: Started
NOTE: recipe consolekit-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 3221 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_populate_sysroot: Succeeded
NOTE: Running task 3222 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3223 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe consolekit-0.4.6-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3224 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3225 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_configure)
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package: Succeeded
NOTE: Running task 3226 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_packagedata)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package: Succeeded
NOTE: Running task 3227 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_packagedata)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Started
NOTE: recipe libsamplerate0-0.1.9-r1: task do_packagedata: Succeeded
NOTE: Running task 3228 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb:do_package_write_rpm)
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe consolekit-0.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3230 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/consolekit/consolekit_0.4.6.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_compile: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe consolekit-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsamplerate0-0.1.9-r1: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-utils-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3231 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 3232 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_compile)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Started
NOTE: recipe bluez5-5.55-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3233 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install)
NOTE: recipe bluez5-5.55-r0: task do_install: Started
NOTE: recipe bluez5-5.55-r0: task do_install: Succeeded
NOTE: Running task 3234 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.55-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3235 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_populate_sysroot)
NOTE: Running task 3236 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package)
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Started
NOTE: recipe bluez5-5.55-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3237 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_prepare_recipe_sysroot)
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3238 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_configure)
NOTE: recipe ofono-1.31-r0: task do_configure: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3239 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_install: Started
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3240 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3241 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_install)
NOTE: recipe alsa-utils-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3242 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_install)
NOTE: recipe harfbuzz-native-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3243 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Started
NOTE: recipe pango-native-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3244 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 3245 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package)
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Started
NOTE: recipe pango-native-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3246 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-native-1.48.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.55-r0: task do_package: Succeeded
NOTE: Running task 3247 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3248 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_packagedata)
NOTE: recipe bluez5-5.55-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe pango-native-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3249 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe pango-native-1.48.0-r0: task do_compile: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 3250 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_packagedata)
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3251 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/alsa-state/alsa-state.bb:do_package_write_rpm)
NOTE: Running task 3252 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb:do_package_write_rpm)
NOTE: Running task 3253 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb:do_package_write_rpm)
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-utils-scripts-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe alsa-state-0.2.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_configure: Succeeded
NOTE: Running task 3254 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_compile)
NOTE: recipe pango-native-1.48.0-r0: task do_compile: Succeeded
NOTE: recipe ofono-1.31-r0: task do_compile: Started
NOTE: Running task 3255 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe pango-native-1.48.0-r0: task do_install: Started
NOTE: recipe alsa-utils-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-native-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3256 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: recipe pango-native-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-native-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3257 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3258 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_compile: Succeeded
NOTE: Running task 3259 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_install)
NOTE: recipe ofono-1.31-r0: task do_install: Started
NOTE: recipe ofono-1.31-r0: task do_install: Succeeded
NOTE: Running task 3260 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_populate_sysroot)
NOTE: Running task 3261 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package)
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Started
NOTE: recipe ofono-1.31-r0: task do_package: Started
NOTE: recipe ofono-1.31-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-native-3.24.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3262 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_configure)
NOTE: recipe librsvg-native-2.40.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3263 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_configure)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_configure: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_configure: Started
NOTE: recipe ofono-1.31-r0: task do_package: Succeeded
NOTE: Running task 3264 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_packagedata)
NOTE: recipe ofono-1.31-r0: task do_packagedata: Started
NOTE: recipe ofono-1.31-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-native-2.40.21-r0: task do_configure: Succeeded
NOTE: Running task 3265 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_compile)
NOTE: recipe librsvg-native-2.40.21-r0: task do_compile: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_compile: Succeeded
NOTE: Running task 3266 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_install)
NOTE: recipe mesa-2_20.2.4-r0: task do_install: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_compile: Succeeded
NOTE: Running task 3267 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_install)
NOTE: recipe librsvg-native-2.40.21-r0: task do_install: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_install: Succeeded
NOTE: Running task 3268 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_populate_sysroot)
NOTE: Running task 3269 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package)
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_install: Succeeded
NOTE: Running task 3270 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot)
NOTE: recipe librsvg-native-2.40.21-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-native-2.40.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_20.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3271 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3272 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3273 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 3274 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3275 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_configure: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_configure: Succeeded
NOTE: Running task 3276 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_compile)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_compile: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package: Succeeded
NOTE: Running task 3277 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_packagedata)
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3278 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.4.bb:do_package_write_rpm)
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3279 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3280 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3281 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3282 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-0.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3283 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_configure)
NOTE: recipe virglrenderer-0.8.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3284 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3285 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_configure: Succeeded
NOTE: Running task 3286 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_compile)
NOTE: recipe virglrenderer-0.8.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_install)
NOTE: recipe virglrenderer-0.8.2-r0: task do_install: Started
NOTE: recipe mesa-2_20.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_install: Succeeded
NOTE: Running task 3288 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_populate_sysroot)
NOTE: Running task 3289 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_package)
NOTE: recipe virglrenderer-0.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_package: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe virglrenderer-0.8.2-r0: task do_package: Succeeded
NOTE: Running task 3290 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_packagedata)
NOTE: recipe virglrenderer-0.8.2-r0: task do_packagedata: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3291 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb:do_package_write_rpm)
NOTE: recipe virglrenderer-0.8.2-r0: task do_package_write_rpm: Started
NOTE: recipe virglrenderer-0.8.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3292 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_compile: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_compile: Succeeded
NOTE: Running task 3293 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_install)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3294 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_install: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_install: Succeeded
NOTE: Running task 3295 of 3401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 3296 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 3297 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package)
NOTE: recipe gtk+3-native-3.24.23-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3298 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3299 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-native-3.24.23-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3300 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3301 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 3302 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_configure: Succeeded
NOTE: Running task 3303 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_compile)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3304 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_compile: Succeeded
NOTE: Running task 3305 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_install)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_install: Succeeded
NOTE: Running task 3306 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package)
NOTE: Running task 3307 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_populate_sysroot)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3308 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3309 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package: Succeeded
NOTE: Running task 3310 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3311 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_configure)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3312 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm)
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3313 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_compile)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3314 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_install)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3315 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3316 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3317 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3318 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.55.bb:do_package_write_rpm)
NOTE: Running task 3319 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_1.31.bb:do_package_write_rpm)
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Started
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ofono-1.31-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.55-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3320 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3321 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3322 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3323 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3324 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3325 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3326 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3327 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3328 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: Running task 3329 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3330 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3331 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3332 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3333 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3334 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.23-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3335 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_configure)
NOTE: recipe gtk+3-3.24.23-r0: task do_configure: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3336 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3337 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_configure: Succeeded
NOTE: Running task 3338 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_compile)
NOTE: recipe gtk+3-3.24.23-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_compile: Succeeded
NOTE: Running task 3339 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_install)
NOTE: recipe gtk+3-3.24.23-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_install: Succeeded
NOTE: Running task 3340 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_populate_sysroot)
NOTE: Running task 3341 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package)
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3342 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3343 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3344 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3345 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3346 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_compile)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package: Succeeded
NOTE: Running task 3347 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_packagedata: Succeeded
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3348 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3349 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3350 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3351 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3352 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3353 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3354 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3355 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_configure)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3356 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_configure)
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Running task 3357 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata)
NOTE: recipe avahi-0.8-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata: Succeeded
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3358 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_package)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3359 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_compile)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3360 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_install)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_install: Succeeded
NOTE: Running task 3361 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3362 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_packagedata)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3363 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3364 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb:do_package_write_rpm)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package: Succeeded
NOTE: Running task 3365 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_packagedata)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3366 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.14.1.bb:do_package_write_rpm)
NOTE: Running task 3367 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package_write_rpm)
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Started
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Started
NOTE: recipe libnss-mdns-0.14.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe avahi-0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.23-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_configure: Succeeded
NOTE: Running task 3368 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-14.0-r0: task do_compile: Succeeded
NOTE: Running task 3369 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_install)
NOTE: recipe pulseaudio-14.0-r0: task do_install: Started
NOTE: recipe pulseaudio-14.0-r0: task do_install: Succeeded
NOTE: Running task 3370 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_populate_sysroot)
NOTE: Running task 3371 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package)
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Started
NOTE: recipe pulseaudio-14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3372 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3373 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3374 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_configure)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3375 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_configure)
NOTE: recipe libsdl2-2.0.12-r0: task do_configure: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package: Succeeded
NOTE: Running task 3376 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_packagedata)
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Started
NOTE: recipe pulseaudio-14.0-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-plugins-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 3377 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_compile)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3378 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_install)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3379 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3380 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_packagedata)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3381 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 3382 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_package_write_rpm)
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Started
NOTE: recipe alsa-plugins-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pulseaudio-14.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsdl2-2.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3383 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_compile)
NOTE: recipe libsdl2-2.0.12-r0: task do_compile: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3384 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_install)
NOTE: recipe libsdl2-2.0.12-r0: task do_install: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_install: Succeeded
NOTE: Running task 3385 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_populate_sysroot)
NOTE: Running task 3386 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_package)
NOTE: recipe libsdl2-2.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_package: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3387 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemu-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemu-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3388 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_configure)
NOTE: recipe qemu-5.1.0-r0: task do_configure: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_package: Succeeded
NOTE: Running task 3389 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_packagedata)
NOTE: recipe libsdl2-2.0.12-r0: task do_packagedata: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3390 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb:do_package_write_rpm)
NOTE: recipe libsdl2-2.0.12-r0: task do_package_write_rpm: Started
NOTE: recipe libsdl2-2.0.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 3391 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_configure_ptest_base)
NOTE: recipe qemu-5.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe qemu-5.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3392 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_compile)
NOTE: recipe qemu-5.1.0-r0: task do_compile: Started
NOTE: recipe qemu-5.1.0-r0: task do_compile: Succeeded
NOTE: Running task 3393 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_compile_ptest_base)
NOTE: recipe qemu-5.1.0-r0: task do_compile_ptest_base: Started
NOTE: recipe qemu-5.1.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3394 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_install)
NOTE: recipe qemu-5.1.0-r0: task do_install: Started
NOTE: recipe qemu-5.1.0-r0: task do_install: Succeeded
NOTE: Running task 3395 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_install_ptest_base)
NOTE: recipe qemu-5.1.0-r0: task do_install_ptest_base: Started
NOTE: recipe qemu-5.1.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3396 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_package)
NOTE: Running task 3397 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_populate_sysroot)
NOTE: recipe qemu-5.1.0-r0: task do_package: Started
NOTE: recipe qemu-5.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe qemu-5.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_package: Succeeded
NOTE: Running task 3398 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_packagedata)
NOTE: recipe qemu-5.1.0-r0: task do_packagedata: Started
NOTE: recipe qemu-5.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3399 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_package_write_rpm)
NOTE: Running task 3400 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_package_qa)
NOTE: recipe qemu-5.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe qemu-5.1.0-r0: task do_package_qa: Started
NOTE: recipe qemu-5.1.0-r0: task do_package_qa: Succeeded
NOTE: recipe qemu-5.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3401 of 3401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu_5.1.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3401 tasks of which 2333 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 10 ERROR messages shown, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6665582872172915244==--
