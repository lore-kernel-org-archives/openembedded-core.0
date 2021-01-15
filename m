Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.688.1610713822595446391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5921A38C13B6
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcr: upgrading to 3.38.1 SUCCEEDED
Message-ID: <MADEUP.165A67B054F7023E.32579@lists.openembedded.org>
X-Groupsio-MsgNum: 146781
Content-Type: multipart/mixed; boundary="===============2280272927821173038=="

--===============2280272927821173038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcr* to *3.38.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-3.38.0-3.38.1.patch
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

--===============2280272927821173038==
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
DISTRO_VERSION       = "3.2+snapshot-8e016a99d12ca94c77c621634c21a3ec3a45451d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e016a99d12ca94c77c621634c21a3ec3a45451d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 143 Found 26 Missed 117 Current 845 (18% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 878 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 888 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 889 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 910 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 984 of 988 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 985 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 986 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-native-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 987 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 988 of 988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-native-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1079 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1372 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1469 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: Running task 1529 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1530 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1531 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1540 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1591 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: Running task 1634 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: Running task 1687 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: Running task 1722 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: Running task 1769 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1770 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1774 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 1778 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1779 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1780 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1781 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1802 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1829 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: Running task 1857 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1858 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: Running task 1859 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: Running task 1860 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1870 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1886 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1887 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1888 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1889 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: Running task 1912 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1937 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1938 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 1956 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: Running task 2006 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2013 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2014 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_fetch)
NOTE: Running task 2015 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 2016 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 2037 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 2038 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2042 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 2048 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2058 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2066 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2067 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: Running task 2068 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2069 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2070 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2071 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: Running task 2072 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: Running task 2073 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2074 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 2134 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 2144 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: Running task 2145 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2146 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2147 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: Running task 2169 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2202 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Started
NOTE: Running task 2220 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: Running task 2236 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2248 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2264 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: Running task 2274 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe vala-0.50.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2276 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2298 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2345 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: Running task 2364 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2365 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 2373 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: Running task 2374 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe vala-0.50.2-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2449 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: Running task 2476 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2501 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2502 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2528 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_write_config)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Started
NOTE: Running task 2625 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: Running task 2689 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2707 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 2708 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: Running task 2709 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2724 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2733 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 2734 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2738 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Started
NOTE: Running task 2760 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2776 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2886 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2887 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2888 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 2889 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2891 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2892 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2894 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe vala-0.50.2-r0: task do_unpack: Succeeded
NOTE: Running task 2895 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_patch)
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2896 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2897 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2898 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2899 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2901 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.50.2-r0: task do_patch: Succeeded
NOTE: Running task 2902 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic unihash changed to 4a33a10ef24bc08ef0307ef84e0d31fd8d9147d737bece6547749e8114984f9d
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d4041a4a48affaafca05a5e4c3d93c77aa466a8c7d00d8d9ab20e5262d434f0f
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2931 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2932 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2933 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2934 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2937 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: Running task 2938 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2939 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2958 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2959 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2960 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2961 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2962 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2963 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: Running task 2964 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2965 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2966 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2967 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 0f9421dca25c576b826474b0e95dade406781e1c7de20748017962073d574ad4
NOTE: Setscene tasks completed
NOTE: Running task 2993 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2999 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3001 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 3002 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3003 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_configure)
NOTE: Running task 3004 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3007 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: Running task 3008 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 3010 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3013 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3014 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: Running task 3016 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3017 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 3018 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 3019 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3020 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3023 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3025 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3027 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3030 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3031 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3033 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3034 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: Running task 3036 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: Running task 3037 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3039 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3040 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3041 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3042 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: Running task 3043 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: Running task 3044 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3045 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3046 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3047 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3048 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3049 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3050 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3051 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3053 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3054 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3055 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3057 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3058 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3061 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3062 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_configure: Succeeded
NOTE: Running task 3065 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_compile)
NOTE: recipe vala-0.50.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 3066 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 3074 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3078 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3079 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3081 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 3083 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3084 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3085 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3086 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3088 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3089 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3090 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3091 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3092 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3093 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3094 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3095 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3096 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3097 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3099 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3103 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3104 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3105 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3106 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3108 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3109 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3110 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3111 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3112 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3113 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3114 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3115 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 3117 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3118 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3119 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe vala-0.50.2-r0: task do_compile: Succeeded
NOTE: Running task 3120 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3121 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3122 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3124 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3125 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package)
NOTE: Running task 3127 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3128 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3129 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3130 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3131 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: Running task 3134 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3135 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_package: Succeeded
NOTE: Running task 3136 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 3137 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: Running task 3138 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3139 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3140 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 3141 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3142 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3143 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3144 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3145 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3146 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3148 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3149 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3150 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3151 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3152 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3153 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3154 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3155 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3156 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3157 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3158 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: Running task 3159 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3160 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3165 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3166 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_compile)
NOTE: recipe gcr-3.38.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3167 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3171 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3172 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_install)
NOTE: recipe gcr-3.38.1-r0: task do_install: Started
NOTE: recipe gcr-3.38.1-r0: task do_install: Succeeded
NOTE: Running task 3173 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package)
NOTE: Running task 3174 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package: Succeeded
NOTE: Running task 3175 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_packagedata)
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3176 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_write_rpm)
NOTE: Running task 3177 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_qa)
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3178 of 3178 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3178 tasks of which 2884 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 28 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2280272927821173038==
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
DISTRO_VERSION       = "3.2+snapshot-8e016a99d12ca94c77c621634c21a3ec3a45451d"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e016a99d12ca94c77c621634c21a3ec3a45451d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 138 Found 21 Missed 117 Current 846 (15% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 880 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1079 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: Running task 1467 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1523 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1524 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1525 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1534 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1612 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: Running task 1628 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1669 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1704 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: Running task 1743 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1744 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1745 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1753 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1754 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1755 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: Running task 1756 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1757 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: Running task 1758 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1761 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 1765 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1786 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1807 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1815 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1867 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1868 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1869 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1870 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1893 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1918 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1919 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1937 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1958 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1988 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: Running task 1995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1998 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 2043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2044 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: Running task 2084 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: Running task 2135 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_fetch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 2177 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Started
NOTE: Running task 2222 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2223 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2224 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: Running task 2225 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: Running task 2231 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 2232 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: Running task 2233 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2244 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 2245 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2246 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2263 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 2264 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2265 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2266 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 2267 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe vala-0.50.2-r0: task do_fetch: Succeeded
NOTE: Running task 2268 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: Running task 2269 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: Running task 2270 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: Running task 2271 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_unpack)
NOTE: Running task 2277 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2325 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2341 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2428 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe vala-0.50.2-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: Running task 2502 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_write_config)
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 2553 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2704 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2851 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: Running task 2852 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 2853 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2854 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2855 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2856 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2857 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2858 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: Running task 2859 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2860 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 2861 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: Running task 2862 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2863 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: Running task 2864 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: Running task 2865 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2866 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2867 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: Running task 2869 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2870 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2871 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2873 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_patch: Succeeded
NOTE: Running task 2874 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: Running task 2875 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic)
NOTE: Running task 2876 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.50.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 2878 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 37b13c2fd369d8f1cbb30d7498e8ed15c2aa31eab2163136d11ca50fb4715ab0
NOTE: Running task 2907 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2909 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2910 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Started
NOTE: Running task 2913 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2914 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2930 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Succeeded
NOTE: Running task 2933 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic unihash changed to 4a33a10ef24bc08ef0307ef84e0d31fd8d9147d737bece6547749e8114984f9d
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2934 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2935 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2936 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2937 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2938 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2939 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2940 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2941 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2942 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2f87c1f8835bea5fb54c2522c9fffb8ea62a07ad29d07add5b6484f22177419
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2950 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2969 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2974 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2977 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2978 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2979 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2980 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2982 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2983 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: Running task 2989 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2990 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe vala-0.50.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2992 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2993 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2994 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: Running task 2997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2998 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2999 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3001 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3004 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3005 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3009 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3010 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: Running task 3016 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3017 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 3019 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3022 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3023 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3028 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3029 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3031 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3032 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_configure: Succeeded
NOTE: Running task 3034 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_compile)
NOTE: recipe vala-0.50.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3037 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3038 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3041 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3045 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3046 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3047 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 3050 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3051 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3052 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3057 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3058 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3059 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3061 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: Running task 3063 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3066 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 3068 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3069 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3070 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: Running task 3071 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3073 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3074 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3077 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3080 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3081 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3083 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3084 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3085 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3086 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3087 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3088 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 3089 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3090 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3091 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3092 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe vala-0.50.2-r0: task do_compile: Succeeded
NOTE: Running task 3094 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3096 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3097 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3098 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_install: Succeeded
NOTE: Running task 3099 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: Running task 3100 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package)
NOTE: Running task 3101 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3102 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3103 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3104 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3105 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3106 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 3107 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3108 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 3109 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: Running task 3110 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Succeeded
NOTE: Running task 3112 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3113 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3116 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3117 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 3118 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3119 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3120 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3121 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3122 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: Running task 3123 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3124 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3125 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3127 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3128 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3129 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3130 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3131 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3132 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3133 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3134 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3135 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3136 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3138 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3140 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: Running task 3141 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3147 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3148 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_compile)
NOTE: recipe gcr-3.38.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3149 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3153 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3154 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_install)
NOTE: recipe gcr-3.38.1-r0: task do_install: Started
NOTE: recipe gcr-3.38.1-r0: task do_install: Succeeded
NOTE: Running task 3155 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package)
NOTE: Running task 3156 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package: Succeeded
NOTE: Running task 3157 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_packagedata)
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_write_rpm)
NOTE: Running task 3159 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_qa)
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3160 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3160 tasks of which 2866 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 28 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2280272927821173038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (0 cached, 810 parsed). 1420 targets, 43 skipped, 0 masked, 0 errors.
Removing 130 recipes from the core2-32 sysroot...done.
Removing 134 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8e016a99d12ca94c77c621634c21a3ec3a45451d"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e016a99d12ca94c77c621634c21a3ec3a45451d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 671 Found 553 Missed 118 Current 328 (82% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 329 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 342 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 374 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 377 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 380 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 381 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 382 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 383 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 384 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 385 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 386 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 387 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 388 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 389 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 390 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
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
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 391 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 394 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 395 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 424 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 425 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 426 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 427 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 439 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 447 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 451 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 452 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 453 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 457 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 460 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 470 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 471 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 472 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 473 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 480 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.182-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 483 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 486 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 489 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 491 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-1_247.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 492 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 495 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 496 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 499 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 500 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 502 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 503 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 505 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 506 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 507 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 508 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 509 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 511 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 512 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 513 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 535 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 540 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 541 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 544 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 550 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 551 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 552 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 554 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-3.9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 555 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 558 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 561 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 562 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 573 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 574 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 584 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 585 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 589 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-conf-247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 595 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.182.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 619 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 627 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 634 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 636 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 644 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 646 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 658 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.182-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 699 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 703 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 725 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 780 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 812 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 813 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 814 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 816 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: Running task 845 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: Running task 916 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: Running task 936 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 937 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 939 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 943 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe mesa-2_20.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 955 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe mesa-2_20.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 717 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 997 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1035 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1036 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1037 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1038 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1060 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: Running task 1062 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1072 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1073 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1080 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1122 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: recipe bison-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1140 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_fetch)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1141 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1142 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1143 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1144 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1161 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1162 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: Running task 1163 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1173 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: Running task 1176 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 1177 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: Running task 1211 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: Running task 1217 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: Running task 1218 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe vala-0.50.2-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 1254 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_fetch)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: Running setscene task 734 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 736 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running task 1267 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: Running task 1268 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1269 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1323 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: Running task 1349 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: Running task 1351 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: Running task 1360 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1361 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: Running setscene task 738 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running setscene task 739 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1396 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1397 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_unpack)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1401 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: Running task 1403 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: Running task 1404 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: Running setscene task 746 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: Running task 1416 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1457 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 748 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: recipe vala-0.50.2-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.103-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 751 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1473 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: Running setscene task 754 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.103.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 755 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1531 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 1571 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1668 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 1678 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1679 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 1680 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1684 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 1691 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1692 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 1697 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: Running task 1702 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.103-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 1703 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 1708 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1709 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 760 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: Running task 1710 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1712 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: Running task 1713 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: Running task 1714 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1715 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: Running task 1716 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running setscene task 762 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 765 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1717 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 768 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1719 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1720 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1721 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1727 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1728 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1729 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1730 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 1735 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: Running task 1736 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.50.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1737 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1738 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1739 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Started
NOTE: Running task 1744 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 772 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 775 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1750 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.50.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1751 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1752 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic unihash changed to 4a33a10ef24bc08ef0307ef84e0d31fd8d9147d737bece6547749e8114984f9d
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1765 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 780 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1766 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 783 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 786 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1768 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 794 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 801 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 809 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 811 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 813 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 816 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1787 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1788 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_populate_sysroot_setscene)
NOTE: Running task 1795 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1797 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: Running setscene task 827 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 829 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 835 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 837 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 839 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 840 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 1804 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 849 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 854 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 860 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 863 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1846 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 866 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.31.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 870 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 871 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1855 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 877 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 880 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.10.5+gitAUTOINC+47c7a3148a_f08df324cc-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 884 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.31-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 886 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1874 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 892 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 896 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 900 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe util-linux-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 914 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 915 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 916 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 917 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 922 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 923 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 924 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 925 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1912 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-3.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: Running setscene task 928 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 929 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 930 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 933 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 935 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 936 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 937 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 938 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.34.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1i-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 943 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.34.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1i-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 949 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 950 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 952 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 954 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 958 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 965 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 969 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 972 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1993 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 974 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 8aee874b86bf32f2d6775679a54b0a6b02a3acbb944a6280782ba5b76ec44d91
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1997 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 985 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+1e4204d522-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 993 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 994 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 997 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 999 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 999 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2306 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2493 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 2526 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2527 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2536 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2620 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2621 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2622 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2639 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2640 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 606c018e80990d3d160802f550d145d7183be4710cf26edb902f108f7c3dc2e0
NOTE: Running task 2961 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2968 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2971 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2976 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2977 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2978 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2979 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3016 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: Running task 3017 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3018 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: Running task 3019 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3020 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3022 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 3024 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3025 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3027 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3028 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe vala-0.50.2-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 3029 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 3031 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 3034 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 3035 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 3036 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 3037 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: Running task 3038 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3039 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3042 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 3043 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3045 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3046 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3047 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3048 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3049 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3050 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3051 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3052 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3053 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3054 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3055 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3059 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3061 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3062 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3065 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3066 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3068 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3069 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3070 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 3071 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3073 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3074 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3080 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3081 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe vala-0.50.2-r0: task do_configure: Succeeded
NOTE: Running task 3083 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_compile)
NOTE: recipe vala-0.50.2-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3084 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3085 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3086 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 3087 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3088 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3094 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 3096 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3097 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3098 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3099 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3100 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3101 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3102 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3103 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3104 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3105 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3106 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3107 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: Running task 3108 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 3109 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3110 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3111 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3112 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3113 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3115 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3116 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3117 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3118 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3119 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3121 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3122 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3123 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3125 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3127 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3129 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 3130 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3131 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3132 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3133 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3135 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3136 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3137 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3138 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3139 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3140 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3141 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3142 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3143 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3144 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3145 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3146 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3147 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3148 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_compile: Succeeded
NOTE: Running task 3149 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 3150 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 3151 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: Running task 3152 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_install: Succeeded
NOTE: Running task 3153 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package)
NOTE: Running task 3154 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_populate_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3155 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3156 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3157 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 3159 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3160 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Succeeded
NOTE: Running task 3161 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_packagedata)
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3162 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3163 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3164 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3165 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3167 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3168 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3169 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3170 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3171 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3172 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3173 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3174 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: Running task 3175 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3176 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3177 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3178 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3179 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: Running task 3180 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3181 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3186 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3187 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_compile)
NOTE: recipe gcr-3.38.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3188 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3192 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3193 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_install)
NOTE: recipe gcr-3.38.1-r0: task do_install: Started
NOTE: recipe gcr-3.38.1-r0: task do_install: Succeeded
NOTE: Running task 3194 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package)
NOTE: Running task 3195 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package: Succeeded
NOTE: Running task 3196 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_packagedata)
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3197 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_write_rpm)
NOTE: Running task 3198 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_qa)
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3199 of 3199 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3199 tasks of which 2895 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2280272927821173038==
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
DISTRO_VERSION       = "3.2+snapshot-8e016a99d12ca94c77c621634c21a3ec3a45451d"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e016a99d12ca94c77c621634c21a3ec3a45451d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 138 Found 21 Missed 117 Current 846 (15% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 880 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1079 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: Running task 1467 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1523 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1524 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1525 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1534 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: Running task 1627 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1702 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1748 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1749 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: Running task 1750 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1751 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1754 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 1758 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: Running task 1779 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1806 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1858 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1859 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1860 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1861 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1873 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1874 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1884 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1887 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: Running task 1888 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1889 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: Running task 1890 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: Running task 1891 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: Running task 1916 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1917 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: Running task 1936 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: Running task 1957 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1958 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1987 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: Running task 1994 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 2042 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: Running task 2043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2094 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2108 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2109 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: Running task 2125 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 2137 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: Running task 2143 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2144 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: Running task 2165 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: Running task 2166 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 2167 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 2168 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: Running task 2169 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 2170 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 2171 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: Running task 2172 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2173 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: Running task 2174 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2240 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2323 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: Running task 2324 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2325 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: Running task 2326 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 2375 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_unpack)
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 2430 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2446 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_unpack)
NOTE: Running task 2447 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2500 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2542 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 2553 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2566 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: Running task 2568 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2584 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_unpack: Started
NOTE: Running task 2620 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2640 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Started
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2774 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2855 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 2856 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2857 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2858 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2859 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2860 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2862 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2863 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 2864 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: Running task 2865 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2866 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2867 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2868 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 2870 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2871 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2873 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2874 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_patch: Started
NOTE: Running task 2876 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 2878 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2880 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2881 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: recipe vala-0.50.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2882 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to c961e1b507439ea1c330271d040ab6ee92c4dce7926f5d1a6aa27a1015e2bb87
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2911 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2912 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: Running task 2913 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2914 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2915 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: Running task 2916 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2917 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic unihash changed to 4a33a10ef24bc08ef0307ef84e0d31fd8d9147d737bece6547749e8114984f9d
NOTE: Running task 2918 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2919 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2922 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2923 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: Running task 2924 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: Running task 2925 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: Running task 2926 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: Running task 2927 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2945 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2946 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2947 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2948 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2949 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 19cc089a98f77e08e9f9ea2d7007eb5a13fbc73703034d5bbdc3d372ce429274
NOTE: Setscene tasks completed
NOTE: Running task 2974 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2981 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2982 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2983 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 2985 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2989 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_configure: Started
NOTE: Running task 2990 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2992 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2993 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2998 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2999 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3001 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3009 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3010 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3011 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3014 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3015 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3017 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3018 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: Running task 3021 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3022 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3023 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3026 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3028 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3029 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3030 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3031 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3032 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3033 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3034 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3035 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3037 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3038 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: Running task 3040 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 3041 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_configure: Succeeded
NOTE: Running task 3044 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.50.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3051 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 3052 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3053 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: Running task 3054 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3055 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 3056 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 3057 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3058 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3059 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3060 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3061 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3063 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3066 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3067 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3068 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3070 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 3071 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3072 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3073 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3074 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3076 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3077 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3078 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3079 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3080 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3083 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3084 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3085 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3086 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3089 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3090 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3091 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3092 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3093 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3094 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3095 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3096 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3097 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3098 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3100 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 3101 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3102 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3103 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3104 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: Running task 3105 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3107 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3108 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3109 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3110 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 3111 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3112 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe vala-0.50.2-r0: task do_compile: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3113 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_install)
NOTE: recipe vala-0.50.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3114 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.50.2-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package)
NOTE: Running task 3116 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_populate_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 3117 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 3118 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: Running task 3119 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_package: Succeeded
NOTE: Running task 3120 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_packagedata)
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Started
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3121 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 3122 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3123 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3125 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3126 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3127 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3128 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3129 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3130 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3131 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3132 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3134 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3135 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3136 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3138 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3140 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: Running task 3141 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3147 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3148 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_compile)
NOTE: recipe gcr-3.38.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3149 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3153 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3154 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_install)
NOTE: recipe gcr-3.38.1-r0: task do_install: Started
NOTE: recipe gcr-3.38.1-r0: task do_install: Succeeded
NOTE: Running task 3155 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package)
NOTE: Running task 3156 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package: Succeeded
NOTE: Running task 3157 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_packagedata)
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_write_rpm)
NOTE: Running task 3159 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_qa)
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3160 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3160 tasks of which 2866 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2280272927821173038==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-3.38.0-3.38.1.patch"

From 50ed26a00a656eb398ae73212ce53d1a413c9af0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:33:54 +0000
Subject: [PATCH] gcr: upgrade 3.38.0 -> 3.38.1

---
 meta/recipes-gnome/gcr/{gcr_3.38.0.bb => gcr_3.38.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_3.38.0.bb => gcr_3.38.1.bb} (91%)

diff --git a/meta/recipes-gnome/gcr/gcr_3.38.0.bb b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
similarity index 91%
rename from meta/recipes-gnome/gcr/gcr_3.38.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.38.1.bb
index 49e8f1848b..40e67f23ae 100644
--- a/meta/recipes-gnome/gcr/gcr_3.38.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.38.1.bb
@@ -17,7 +17,7 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "a64cc7b65757fc2cd16de1708d132a16d05cd1f62c6eba436d56fe45d4ba27e1"
+SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.27.0


--===============2280272927821173038==
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
DISTRO_VERSION       = "3.2+snapshot-8e016a99d12ca94c77c621634c21a3ec3a45451d"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8e016a99d12ca94c77c621634c21a3ec3a45451d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 138 Found 21 Missed 117 Current 846 (15% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 880 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 984 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.301-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1078 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe adwaita-icon-theme-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_fetch)
NOTE: Running task 1467 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1523 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1524 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1525 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1534 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Started
NOTE: Running task 1627 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1702 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: Running task 1748 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1749 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1752 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_write_config)
NOTE: Running task 1756 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1777 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_fetch: Succeeded
NOTE: Running task 1804 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: Running task 1839 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_unpack)
NOTE: Running task 1840 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: Running task 1858 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1859 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_fetch)
NOTE: Running task 1860 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1861 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1884 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1909 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_fetch)
NOTE: Running task 1910 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1919 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1920 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1921 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_fetch: Succeeded
NOTE: Running task 1923 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: Running task 1924 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1925 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1936 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Started
NOTE: Running task 1937 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1938 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: Running task 1987 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_write_config)
NOTE: Running task 1994 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_fetch)
NOTE: Running task 1995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_fetch)
NOTE: Running task 1996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 2042 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_write_config)
NOTE: Running task 2043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe pango-1.48.0-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 2103 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: Running task 2117 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 2135 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_fetch)
NOTE: recipe pango-1.48.0-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: Running task 2136 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 2137 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 2138 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_unpack)
NOTE: Running task 2139 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 2140 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2141 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 2142 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 2143 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_unpack)
NOTE: Running task 2144 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 2145 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 2146 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_patch)
NOTE: Running task 2147 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2148 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2149 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe vala-0.50.2-r0: task do_fetch: Started
NOTE: Running task 2208 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2227 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Started
NOTE: Running task 2242 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Started
NOTE: Running task 2256 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe libgcrypt-1.8.7-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: Running task 2279 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2290 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_write_config: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2332 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2359 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_unpack)
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2499 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_write_config)
NOTE: Running task 2518 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_unpack: Started
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_unpack: Succeeded
NOTE: Running task 2707 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2750 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 2764 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2850 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_patch)
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2851 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe pango-1.48.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2852 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_patch)
NOTE: Running task 2853 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Started
NOTE: Running task 2854 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2855 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2856 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2857 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: Running task 2858 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2859 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe pango-1.48.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2860 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: Running task 2862 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2863 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: Running task 2864 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2865 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 2866 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2867 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcr-3.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_unpack: Succeeded
NOTE: Running task 2869 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2871 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Started
NOTE: Running task 2872 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_patch: Succeeded
NOTE: Running task 2873 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2874 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_generate_toolchain_file)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.50.2-r0: task do_unpack: Succeeded
NOTE: Running task 2876 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_patch)
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2877 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2878 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe vala-0.50.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2879 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cd4c61dd8a6ed1b3ad75c3dc51c019d64a81088a9ff8e572e5451c8eccc1c2bf
NOTE: recipe gcr-3.38.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_lic unihash changed to 4a33a10ef24bc08ef0307ef84e0d31fd8d9147d737bece6547749e8114984f9d
NOTE: recipe vala-0.50.2-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2909 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2910 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2911 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: Running task 2912 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2913 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_configure)
NOTE: Running task 2914 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2917 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2918 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2919 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2920 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_configure)
NOTE: Running task 2921 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2922 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: Running task 2940 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2941 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2943 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.50.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2944 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2945 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2946 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 2947 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2948 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2a19e722cc67a7f7657c848ae4d23cc5d17c2bda02f1f9ef02bd50166c44b01a
NOTE: Setscene tasks completed
NOTE: Running task 2974 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2980 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_unpack: Succeeded
NOTE: Running task 2981 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2982 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_patch: Succeeded
NOTE: Running task 2983 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2984 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2986 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2987 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_configure: Started
NOTE: Running task 2988 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: Running task 2989 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: Running task 2990 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2991 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2992 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_configure: Succeeded
NOTE: Running task 2993 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2994 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2995 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2996 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2998 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2999 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3000 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 3001 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3003 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 3005 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3006 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.6.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3007 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 3009 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: Running task 3010 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 3011 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3015 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 3017 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 3018 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 3019 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3022 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3023 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 3025 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 3026 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 3027 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3028 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3029 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3030 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3031 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libgpg-error-1.39-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 3035 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3038 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3039 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_compile: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: Running task 3041 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_compile)
NOTE: recipe vala-0.50.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3044 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3045 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3046 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libgpg-error-1.39-r0: task do_compile: Succeeded
NOTE: Running task 3048 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_install)
NOTE: recipe libgpg-error-1.39-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_install: Succeeded
NOTE: Running task 3054 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot)
NOTE: Running task 3055 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package)
NOTE: recipe shared-mime-info-2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3056 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3057 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3058 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_configure)
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3059 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3060 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3061 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: Running task 3062 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3063 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3064 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3066 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3067 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3068 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3069 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3071 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3072 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3073 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3074 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3075 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3076 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3077 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3078 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3080 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3081 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3082 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3083 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3085 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3086 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3087 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3088 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3089 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3090 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_install)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_configure: Succeeded
NOTE: Running task 3091 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_compile)
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3092 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_populate_sysroot)
NOTE: Running task 3093 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3094 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_compile: Succeeded
NOTE: Running task 3095 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe vala-0.50.2-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3096 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3097 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3098 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.50.2-r0: task do_install: Succeeded
NOTE: Running task 3100 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package)
NOTE: Running task 3101 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_populate_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_package: Started
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.50.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_install)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_configure: Succeeded
NOTE: Running task 3103 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.8.7-r0: task do_install: Succeeded
NOTE: Running task 3104 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package)
NOTE: Running task 3105 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3107 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.48.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3108 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3109 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_configure)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3110 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_compile)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3111 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3112 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_install)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Started
NOTE: recipe vala-0.50.2-r0: task do_package: Succeeded
NOTE: Running task 3113 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_packagedata)
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_install: Succeeded
NOTE: Running task 3115 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3116 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package)
NOTE: Running task 3117 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Started
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe libgcrypt-1.8.7-r0: task do_packagedata: Succeeded
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: Running task 3118 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.7.bb:do_package_write_rpm)
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
ERROR: vala-0.50.2-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.3-r0 to 0:0.50.2-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.50.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3119 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.50.2.bb:do_package_write_rpm)
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Started
NOTE: recipe libgcrypt-1.8.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3120 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package: Succeeded
NOTE: Running task 3121 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3122 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.38.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3123 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3124 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3125 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3126 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_compile: Succeeded
NOTE: Running task 3127 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3128 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_install: Started
NOTE: recipe pango-1.48.0-r0: task do_install: Succeeded
NOTE: Running task 3129 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.48.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3130 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_populate_sysroot)
NOTE: Running task 3131 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package)
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.48.0-r0: task do_package: Started
NOTE: recipe pango-1.48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3132 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.50.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3133 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3134 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.48.0-r0: task do_package: Succeeded
NOTE: Running task 3135 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3136 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_configure)
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Started
NOTE: recipe pango-1.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3137 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.48.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.48.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.24-r0: task do_configure: Succeeded
NOTE: Running task 3138 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_compile)
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_compile: Succeeded
NOTE: Running task 3139 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_install)
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_install: Succeeded
NOTE: Running task 3140 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package)
NOTE: Running task 3141 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3142 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3147 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_configure)
NOTE: recipe gcr-3.38.1-r0: task do_configure: Started
NOTE: recipe gcr-3.38.1-r0: task do_configure: Succeeded
NOTE: Running task 3148 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_compile)
NOTE: recipe gcr-3.38.1-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package: Succeeded
NOTE: Running task 3149 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_packagedata: Succeeded
NOTE: Running task 3153 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_compile: Succeeded
NOTE: Running task 3154 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_install)
NOTE: recipe gcr-3.38.1-r0: task do_install: Started
NOTE: recipe gcr-3.38.1-r0: task do_install: Succeeded
NOTE: Running task 3155 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package)
NOTE: Running task 3156 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.1-r0: task do_package: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package: Succeeded
NOTE: Running task 3157 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_packagedata)
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.24-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_write_rpm)
NOTE: Running task 3159 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_package_qa)
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.1-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3160 of 3160 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3160 tasks of which 2866 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 28 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============2280272927821173038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 3127296 to 3127420 (+0%)
packages/core2-32-poky-linux/gcr/gcr-dbg: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-dbg: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-dev: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-dev: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-doc: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-doc: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-af: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-af: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-as: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-as: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-az: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-az: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-be: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-da: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-da: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-de: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-de: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-el: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-el: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-es: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-es: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-et: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-et: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-he: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-he: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-id: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-id: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-is: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-is: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-it: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-it: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-or: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-or: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-si: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-si: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-te: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-te: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-th: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-th: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PKGSIZE changed from 15025 to 15940 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-src: PKGSIZE changed from 2458891 to 2458958 (+0%)
packages/core2-32-poky-linux/gcr/gcr-src: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-src: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr-staticdev: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr-staticdev: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr/gcr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]
packages/core2-32-poky-linux/gcr/gcr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/gcr/3.38/gcr-3.38.0.tar.xz;name=archive" to "https://ftp.gnome.org/pub/GNOME/sources/gcr/3.38/gcr-3.38.1.tar.xz;name=archive"
packages/core2-32-poky-linux/gcr: PV changed from "3.38.0" to "3.38.1"
packages/core2-32-poky-linux/gcr: PKGV changed from 3.38.0 [default] to 3.38.1 [default]

--===============2280272927821173038==--
