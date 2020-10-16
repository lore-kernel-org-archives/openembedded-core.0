Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12220.1602843683020080320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2988D38C1755
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gcr: upgrading to 3.38.0 SUCCEEDED
Message-ID: <MADEUP.163E71D6CAB90A07.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143453
Content-Type: multipart/mixed; boundary="===============1323058073621252207=="

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gcr* to *3.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gcr-upgrade-3.36.0-3.38.0.patch
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

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gcr/gcr-locale-uk: PKGSIZE changed from 18800 to 20816 (+11%)

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1478 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f360cea56e9cf326f9f4792eec50bc6c3260b3a"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 160 Found 46 Missed 114 Current 803 (28% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 847 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 858 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 859 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 883 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_package_write_rpm_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 960 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 961 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 962 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 963 of 963 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1213 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_fetch)
NOTE: Running task 1314 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1384 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1385 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1386 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1412 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_unpack)
NOTE: Running task 1486 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1540 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1557 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1559 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1560 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Started
NOTE: Running task 1579 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe pango-1.46.2-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1587 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_unpack)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1607 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1614 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1640 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1641 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1642 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1643 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1644 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1645 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_patch)
NOTE: Running task 1653 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_write_config)
NOTE: Running task 1661 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: Running task 1678 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe pango-1.46.2-r0: task do_unpack: Started
NOTE: Running task 1685 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1702 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_fetch)
NOTE: Running task 1703 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: Running task 1746 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 1774 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_fetch)
NOTE: Running task 1775 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1776 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1777 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1778 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1807 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1826 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Started
NOTE: Running task 1848 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Started
NOTE: Running task 1857 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1859 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 1914 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_write_config)
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: Running task 1915 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Started
NOTE: Running task 1916 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 1917 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1918 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1923 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 1932 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: Running task 1936 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe pango-1.46.2-r0: task do_unpack: Succeeded
NOTE: Running task 1937 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1938 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_fetch)
NOTE: Running task 1946 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_patch)
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 1951 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Started
NOTE: Running task 1987 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1988 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 1995 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_write_config)
NOTE: Running task 1996 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: Running task 1997 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Started
NOTE: Running task 1998 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 1999 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_fetch: Started
NOTE: Running task 2000 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_write_config)
NOTE: recipe pango-1.46.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe vala-0.48.9-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2016 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: Running task 2030 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_patch: Succeeded
NOTE: Running task 2031 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_unpack)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Started
NOTE: Running task 2044 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: Running task 2049 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2087 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2116 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_fetch)
NOTE: Running task 2120 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2146 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe vala-0.48.9-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2190 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2217 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Succeeded
NOTE: Running task 2233 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2234 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: Running task 2235 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_patch)
NOTE: Running task 2236 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: Running task 2237 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: Running task 2258 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: Running task 2259 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2260 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: Running task 2261 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_patch)
NOTE: Running task 2262 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Started
NOTE: Running task 2298 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 2342 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: Running task 2343 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2440 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2479 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2514 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2523 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_write_config)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 2642 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_generate_toolchain_file)
NOTE: Running task 2643 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2721 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2722 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2727 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Succeeded
NOTE: Running task 2850 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2851 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch)
NOTE: Running task 2865 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: Running task 2899 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2900 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2901 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2902 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2903 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2904 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_patch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.48.9-r0: task do_unpack: Succeeded
NOTE: Running task 2905 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2906 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2907 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2908 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2909 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2910 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2911 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2912 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2913 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2914 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2915 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic unihash changed to 90d18f0235e4670a3e7215ebeb8cf16c8cb74346eb86b1fbab06f3f8c62f5025
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2916 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2917 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_patch: Succeeded
NOTE: Running task 2918 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2919 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2920 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2921 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2922 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2923 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2924 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_configure)
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe vala-0.48.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Succeeded
NOTE: Running task 2925 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_patch)
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2926 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Succeeded
NOTE: Running task 2927 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2928 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2929 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2930 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2932 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2933 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2935 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2936 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 2937 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Succeeded
NOTE: Running task 2939 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2940 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_install)
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2942 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2944 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2945 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2946 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2947 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2948 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Succeeded
NOTE: Running task 2949 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2950 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package)
NOTE: Running task 2951 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2952 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2953 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2954 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2955 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2956 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2957 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2959 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2961 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2962 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2963 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Succeeded
NOTE: Running task 2964 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2965 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2966 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: Running task 2967 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Started
NOTE: Running task 2968 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2969 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2970 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2971 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2972 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Succeeded
NOTE: Running task 2974 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2975 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2976 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2977 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_install)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2979 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2980 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 2981 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot)
NOTE: Running task 2982 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2983 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2984 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2985 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: Running task 2986 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2987 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2988 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2989 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2990 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 2991 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2992 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2993 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 2994 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2995 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_configure: Succeeded
NOTE: Running task 2996 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3002 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3004 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3008 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3009 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3010 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3011 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3012 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3013 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3014 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3015 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3017 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3018 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3019 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3020 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3021 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3022 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3024 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_compile)
NOTE: Running task 3025 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3027 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3030 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3031 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 3032 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3033 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3034 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3035 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3038 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_configure: Started
NOTE: Running task 3039 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3041 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3042 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 3043 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_compile)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 3044 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_configure: Succeeded
NOTE: Running task 3045 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3046 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3047 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 3048 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Started
NOTE: recipe vala-0.48.9-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_install)
NOTE: recipe vala-0.48.9-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 3050 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3051 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package)
NOTE: Running task 3052 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_install: Succeeded
NOTE: Running task 3053 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package)
NOTE: Running task 3054 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_package: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Succeeded
NOTE: Running task 3056 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3057 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_package: Succeeded
NOTE: Running task 3058 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Started
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3059 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm)
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3060 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3061 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install)
NOTE: recipe pango-1.46.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_install: Succeeded
NOTE: Running task 3062 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3063 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot)
NOTE: Running task 3064 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package)
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3065 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3066 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3067 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3068 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Succeeded
NOTE: Running task 3069 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3070 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3071 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_configure)
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3072 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3073 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Succeeded
NOTE: Running task 3074 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Succeeded
NOTE: Running task 3075 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_install)
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Succeeded
NOTE: Running task 3076 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package)
NOTE: Running task 3077 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3078 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3083 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3084 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_compile)
NOTE: recipe gcr-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Succeeded
NOTE: Running task 3085 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3089 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3090 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_install)
NOTE: recipe gcr-3.38.0-r0: task do_install: Started
NOTE: recipe gcr-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3091 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package)
NOTE: Running task 3092 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_package: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_packagedata)
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3094 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3095 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_qa)
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3096 of 3096 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3096 tasks of which 2806 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1432 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f360cea56e9cf326f9f4792eec50bc6c3260b3a"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 154 Found 40 Missed 114 Current 805 (25% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 849 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1213 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_fetch)
NOTE: Running task 1312 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1378 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1379 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1380 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1406 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1465 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_unpack)
NOTE: Running task 1480 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1522 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: Running task 1539 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1563 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1564 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1568 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1584 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Started
NOTE: recipe pango-1.46.2-r0: task do_fetch: Succeeded
NOTE: Running task 1619 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_unpack)
NOTE: Running task 1621 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1623 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1624 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1625 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1626 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1634 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_write_config)
NOTE: Running task 1642 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 1659 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1666 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_patch)
NOTE: Running task 1684 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_fetch)
NOTE: Running task 1685 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_fetch)
NOTE: recipe pango-1.46.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1755 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1756 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1757 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_fetch)
NOTE: Running task 1758 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_fetch)
NOTE: Running task 1759 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1780 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1789 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_write_config: Started
NOTE: Running task 1828 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 1838 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 1839 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1840 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Started
NOTE: Running task 1842 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_fetch)
NOTE: recipe pango-1.46.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_unpack)
NOTE: Running task 1865 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: Running task 1877 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: Running task 1898 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1899 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1911 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 1912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 1913 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_unpack)
NOTE: Running task 1914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_unpack)
NOTE: Running task 1915 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 1918 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1919 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1921 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_fetch)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 1973 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: Running task 1975 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1976 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 1977 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_write_config)
NOTE: Running task 1978 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_write_config)
NOTE: Running task 1979 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 2058 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2077 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_unpack)
NOTE: Running task 2078 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Started
NOTE: Running task 2081 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe vala-0.48.9-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Started
NOTE: Running task 2091 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 2092 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_unpack)
NOTE: Running task 2095 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_fetch)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2172 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2208 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: Running task 2209 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 2212 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe vala-0.48.9-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2231 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2232 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2251 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe pango-1.46.2-r0: task do_patch: Succeeded
NOTE: Running task 2356 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Succeeded
NOTE: Running task 2367 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_patch)
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2388 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: Running task 2405 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: Running task 2417 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2427 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2494 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: Running task 2497 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2517 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Started
NOTE: Running task 2595 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Started
NOTE: Running task 2623 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Succeeded
NOTE: Running task 2666 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 2732 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_patch)
NOTE: Running task 2734 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2871 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.48.9-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2873 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2874 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2875 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2876 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 2878 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_generate_toolchain_file)
NOTE: Running task 2880 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2881 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: Running task 2882 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2883 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2884 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2885 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2886 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic unihash changed to 90d18f0235e4670a3e7215ebeb8cf16c8cb74346eb86b1fbab06f3f8c62f5025
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Succeeded
NOTE: Running task 2887 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2888 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2889 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2891 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2892 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2893 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2894 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2895 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_patch: Succeeded
NOTE: Running task 2896 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2897 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2898 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2899 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2900 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2901 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2902 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2903 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe vala-0.48.9-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2904 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: Running task 2905 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Succeeded
NOTE: Running task 2906 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_patch)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2907 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2909 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2916 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2917 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2918 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2919 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_compile)
NOTE: Running task 2920 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2922 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_install)
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2924 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2925 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2926 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2927 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2928 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2929 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2932 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2933 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2934 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2935 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2937 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: Running task 2940 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2941 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2944 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2945 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2946 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2947 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Succeeded
NOTE: Running task 2948 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2949 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2950 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Started
NOTE: Running task 2951 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: Running task 2952 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2953 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2954 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Succeeded
NOTE: Running task 2955 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2956 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: Running task 2957 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2959 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2961 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2962 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2963 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2964 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot)
NOTE: Running task 2966 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: Running task 2967 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2969 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2972 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_configure: Succeeded
NOTE: Running task 2978 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_compile)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_compile: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2981 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2984 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2986 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2987 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2988 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2989 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2990 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 2991 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2992 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2993 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2994 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2996 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2998 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2999 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3000 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3001 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3002 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3003 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3004 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3005 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3007 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_compile)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3010 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3011 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3014 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3017 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 3018 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot)
NOTE: Running task 3019 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3020 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_compile: Succeeded
NOTE: Running task 3022 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_install)
NOTE: recipe vala-0.48.9-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3023 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package)
NOTE: Running task 3025 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3026 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_compile)
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3029 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile)
NOTE: Running task 3030 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe pango-1.46.2-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 3032 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 3033 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3034 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package)
NOTE: Running task 3035 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_package: Succeeded
NOTE: Running task 3036 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3037 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3038 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Succeeded
NOTE: Running task 3039 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3040 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3043 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3044 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_install: Succeeded
NOTE: Running task 3045 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3046 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot)
NOTE: Running task 3047 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package)
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3048 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3049 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3050 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_package: Succeeded
NOTE: Running task 3051 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3052 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_configure)
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3053 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Succeeded
NOTE: Running task 3056 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_install)
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package)
NOTE: Running task 3059 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3060 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3065 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3066 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_compile)
NOTE: recipe gcr-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_install)
NOTE: recipe gcr-3.38.0-r0: task do_install: Started
NOTE: recipe gcr-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package)
NOTE: Running task 3074 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_package: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_packagedata)
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3077 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_qa)
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3078 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3078 tasks of which 2788 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1431 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 46 skipped, 0 masked, 0 errors.
Removing 175 recipes from the core2-32 sysroot...done.
Removing 177 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f360cea56e9cf326f9f4792eec50bc6c3260b3a"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 660 Found 546 Missed 114 Current 314 (82% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 315 of 974 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 316 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 330 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 331 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 332 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 337 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 338 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 341 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 346 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 347 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 348 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 356 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 359 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 365 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 366 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 368 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 369 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 374 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 375 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 376 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 377 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 378 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 379 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 380 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 397 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 407 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 408 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 409 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 410 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 422 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 433 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 434 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 435 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 437 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 438 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 439 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 440 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 441 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 455 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 457 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 458 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 459 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 463 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 464 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 465 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 466 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 481 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 482 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 484 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 485 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 491 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 492 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 493 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 494 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 495 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 496 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 497 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 498 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 499 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 500 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 524 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 525 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 526 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 527 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 529 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 530 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 536 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 537 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 538 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 540 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 541 of 974 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 542 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 544 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 545 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 546 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 549 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 551 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 552 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_package_write_rpm_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 553 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 554 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 564 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 565 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: Running setscene task 567 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcrypt-1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: Running setscene task 574 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 587 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 620 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 625 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 630 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 637 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 651 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 667 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-67.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_67.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 686 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 645 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_fetch)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-67.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 710 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 743 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 744 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 745 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 747 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_fetch)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 778 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_unpack)
NOTE: Running task 779 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 711 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running setscene task 717 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_fetch: Started
NOTE: Running task 829 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 834 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 837 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 844 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: Running task 845 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 850 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 852 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 857 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 875 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 876 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 882 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_write_config)
NOTE: Running task 886 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: Running task 896 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_patch)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: Running task 923 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_fetch)
NOTE: Running task 924 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_fetch)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe libcap-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running setscene task 723 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 962 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running setscene task 725 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Started
NOTE: Running task 976 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 978 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 979 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 980 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 981 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_fetch)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 982 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Started
NOTE: Running task 994 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running setscene task 729 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 732 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 733 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: Running task 1003 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 1004 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1006 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_unpack)
NOTE: Running task 1007 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_unpack)
NOTE: Running task 1017 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe pango-1.46.2-r0: task do_write_config: Succeeded
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: Running task 1036 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1041 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_fetch)
NOTE: recipe libcap-2.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: Running task 1086 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1093 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1094 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_fetch)
NOTE: Running task 1095 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1098 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Started
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1132 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1133 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_write_config)
NOTE: Running task 1134 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_write_config)
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Succeeded
NOTE: Running task 1156 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.39-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1157 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: Running task 1159 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Started
NOTE: Running task 1176 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1184 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1202 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_patch)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running setscene task 737 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 739 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 742 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Started
NOTE: recipe vala-0.48.9-r0: task do_fetch: Started
NOTE: Running task 1231 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_fetch)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 1242 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1243 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe vala-0.48.9-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1259 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_unpack)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 1272 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_generate_toolchain_file)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Succeeded
NOTE: Running task 1273 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1274 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 1275 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Started
NOTE: Running task 1304 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_unpack)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 1321 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1362 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1379 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: Running task 1388 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe pango-1.46.2-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running setscene task 744 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 745 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running task 1427 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_patch: Succeeded
NOTE: Running task 1428 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: Running task 1446 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe mesa-2_20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 747 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 748 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 749 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Started
NOTE: Running setscene task 752 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1463 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1493 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: Running task 1502 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: Running task 1530 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_write_config)
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1567 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1568 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: Running task 1569 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: Running setscene task 756 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 1597 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 759 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running task 1616 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1622 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_patch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1655 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Succeeded
NOTE: Running task 1656 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1657 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: Running setscene task 762 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 764 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_20.1.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 1667 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1668 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: Running setscene task 771 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 773 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1670 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.102-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 774 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 775 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 776 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 777 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1672 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: Running task 1673 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 781 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 782 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1674 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 1676 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1678 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1683 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_patch: Started
NOTE: recipe wayland-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1696 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch)
NOTE: Running task 1697 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1714 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1715 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1716 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 789 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1717 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_patch: Started
NOTE: Running setscene task 797 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 801 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 806 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 807 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 809 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 814 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe vala-0.48.9-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1718 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic unihash changed to 90d18f0235e4670a3e7215ebeb8cf16c8cb74346eb86b1fbab06f3f8c62f5025
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 817 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 819 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1743 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 825 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 831 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 834 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 841 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 842 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 852 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 859 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 864 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 878 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 883 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 884 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 887 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1827 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_patch)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Started
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 894 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Succeeded
NOTE: Running task 1836 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 906 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 911 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 913 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 914 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 916 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 917 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 918 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 919 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 920 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 921 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 926 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 927 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 937 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 939 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 940 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 943 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 948 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 951 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 952 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 956 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 958 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 962 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 963 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 964 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 967 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 968 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 969 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 971 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 972 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 974 of 974 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2374 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2419 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2420 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2421 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2432 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2479 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2515 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2537 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2538 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2539 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2561 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2603 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2604 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2932 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2933 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: Running task 2934 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2935 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2936 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2937 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2938 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2939 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2940 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2941 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: Running task 2942 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2943 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2944 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: Running task 2945 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe vala-0.48.9-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2946 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2947 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2948 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2949 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2950 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2951 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2952 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_install)
NOTE: Running task 2953 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2954 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 2955 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2956 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2957 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2959 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Succeeded
NOTE: Running task 2961 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2963 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2964 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2965 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2966 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Succeeded
NOTE: Running task 2967 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot)
NOTE: Running task 2968 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2969 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2970 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2971 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2972 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2973 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2974 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2975 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2976 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2977 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2979 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: Running task 2980 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: Running task 2981 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2983 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2984 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2985 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2986 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2987 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2988 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2989 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Succeeded
NOTE: Running task 2990 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2991 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2992 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2993 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2995 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Succeeded
NOTE: Running task 2997 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2998 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_compile)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_install)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3001 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3002 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 3003 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot)
NOTE: Running task 3004 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 3005 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3006 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: Running task 3007 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 3008 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3009 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3010 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: Running task 3011 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 3012 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3017 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 3018 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 3019 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3020 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe vala-0.48.9-r0: task do_configure: Succeeded
NOTE: Running task 3021 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3023 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3024 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3025 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3026 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 3027 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 3028 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3029 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3030 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3032 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3033 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3034 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3038 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3039 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3041 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3042 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3043 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3044 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 3045 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3046 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3047 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3048 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3049 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Started
NOTE: Running task 3051 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3052 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3053 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3054 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3055 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3056 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 3057 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot)
NOTE: Running task 3058 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3059 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3060 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3061 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3062 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3063 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 3064 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 3065 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Succeeded
NOTE: Running task 3066 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 3067 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_install)
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3068 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 3069 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3070 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: Running task 3072 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3073 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata)
NOTE: Running task 3074 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3075 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Started
NOTE: recipe vala-0.48.9-r0: task do_compile: Succeeded
NOTE: Running task 3076 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_install)
NOTE: recipe vala-0.48.9-r0: task do_install: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_install: Succeeded
NOTE: Running task 3077 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package)
NOTE: Running task 3078 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_package: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3079 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3080 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_install: Succeeded
NOTE: Running task 3081 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3082 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3083 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot)
NOTE: Running task 3084 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3085 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3086 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3087 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3088 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_configure)
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_package: Succeeded
NOTE: Running task 3089 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Started
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3090 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm)
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Succeeded
NOTE: Running task 3091 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3092 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3093 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3094 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Succeeded
NOTE: Running task 3095 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Succeeded
NOTE: Running task 3096 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_install)
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Succeeded
NOTE: Running task 3097 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package)
NOTE: Running task 3098 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3099 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3104 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3105 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_compile)
NOTE: recipe gcr-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Succeeded
NOTE: Running task 3106 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3110 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3111 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_install)
NOTE: recipe gcr-3.38.0-r0: task do_install: Started
NOTE: recipe gcr-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3112 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package)
NOTE: Running task 3113 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_package: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3114 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_packagedata)
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3115 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3116 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_qa)
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3117 of 3117 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3117 tasks of which 2823 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1432 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f360cea56e9cf326f9f4792eec50bc6c3260b3a"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 157 Found 43 Missed 114 Current 802 (27% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 849 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1213 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_fetch)
NOTE: Running task 1312 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1378 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1379 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1380 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1406 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Started
NOTE: Running task 1479 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1496 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_unpack)
NOTE: Running task 1522 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1539 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: Running task 1558 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: Running task 1589 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1590 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_fetch: Started
NOTE: Running task 1597 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1604 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: Running task 1620 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1621 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: Running task 1622 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_unpack)
NOTE: Running task 1623 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1624 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1625 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1626 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1634 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_write_config)
NOTE: Running task 1642 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: Running task 1659 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1666 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1683 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_fetch)
NOTE: Running task 1684 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_fetch)
NOTE: Running task 1693 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: Running task 1755 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1756 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_fetch)
NOTE: Running task 1757 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: Running task 1758 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: Running task 1759 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: Running task 1788 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe pango-1.46.2-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1828 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: Running task 1837 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1839 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_fetch)
NOTE: recipe pango-1.46.2-r0: task do_write_config: Started
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Started
NOTE: Running task 1879 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 1888 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_write_config: Succeeded
NOTE: Running task 1889 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_unpack)
NOTE: Running task 1896 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_write_config)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Started
NOTE: Running task 1911 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: Running task 1912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: Running task 1927 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Started
NOTE: Running task 1937 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: Running task 1951 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 1958 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: Running task 1970 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: Running task 1971 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_write_config)
NOTE: Running task 1972 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Succeeded
NOTE: Running task 1973 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_unpack)
NOTE: Running task 1974 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: Running task 1975 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2084 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: Running task 2197 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2280 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 2348 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2429 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_patch)
NOTE: Running task 2474 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 2841 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2842 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Started
NOTE: Running task 2843 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Started
NOTE: Running task 2844 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_unpack)
NOTE: Running task 2845 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2846 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: Running task 2847 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2848 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: Running task 2849 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2850 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2851 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_unpack)
NOTE: recipe vala-0.48.9-r0: task do_fetch: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Succeeded
NOTE: Running task 2852 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_unpack)
NOTE: Running task 2853 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_unpack)
NOTE: Running task 2854 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: recipe vala-0.48.9-r0: task do_unpack: Started
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Started
NOTE: recipe pango-1.46.2-r0: task do_unpack: Succeeded
NOTE: Running task 2855 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 2856 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_patch)
NOTE: Running task 2857 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe pango-1.46.2-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 2858 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: Running task 2859 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe pango-1.46.2-r0: task do_patch: Succeeded
NOTE: Running task 2860 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Succeeded
NOTE: Running task 2861 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Succeeded
NOTE: Running task 2862 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Succeeded
NOTE: Running task 2863 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2864 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Succeeded
NOTE: Running task 2865 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2866 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: Running task 2867 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: Running task 2868 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2870 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2871 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_generate_toolchain_file)
NOTE: Running task 2873 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2874 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2875 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2876 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_configure)
NOTE: recipe vala-0.48.9-r0: task do_unpack: Succeeded
NOTE: Running task 2877 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2878 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_patch: Started
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2880 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2881 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2882 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: Running task 2883 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: Running task 2884 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2885 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic unihash changed to 90d18f0235e4670a3e7215ebeb8cf16c8cb74346eb86b1fbab06f3f8c62f5025
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2886 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2887 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2888 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2889 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: Running task 2890 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: Running task 2891 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: Running task 2892 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_configure)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2894 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2895 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe vala-0.48.9-r0: task do_patch: Succeeded
NOTE: Running task 2896 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2897 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Succeeded
NOTE: Running task 2898 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2899 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_configure)
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Started
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2900 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2901 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2902 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2903 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2904 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2905 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2906 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2907 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2908 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2909 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2916 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2917 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2918 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2919 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2920 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2921 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2922 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2923 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Succeeded
NOTE: Running task 2924 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2925 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Succeeded
NOTE: Running task 2926 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2927 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2928 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2929 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Succeeded
NOTE: Running task 2930 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot)
NOTE: Running task 2931 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2932 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: Running task 2933 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2934 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2935 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2937 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2939 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2940 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2941 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2942 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2943 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: Running task 2944 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2945 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: Running task 2946 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2947 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2948 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2950 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 2951 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2952 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: Running task 2953 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Succeeded
NOTE: Running task 2954 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2955 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2956 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2957 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 2958 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_compile)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Succeeded
NOTE: Running task 2959 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2960 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2961 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2962 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: Running task 2963 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2964 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2965 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2966 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2967 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 2968 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot)
NOTE: Running task 2969 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2971 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2972 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 2973 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_configure: Succeeded
NOTE: Running task 2978 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_compile)
NOTE: recipe vala-0.48.9-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 2979 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2980 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2981 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2982 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2983 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2984 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 2985 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2986 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2987 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2988 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2989 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2990 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2991 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2992 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2993 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 2994 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2995 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2996 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2997 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 2998 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2999 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3000 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3001 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3002 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3003 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3004 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3005 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 3006 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3007 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 3008 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3010 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 3011 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3012 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3013 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3015 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3016 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 3017 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: Running task 3018 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3019 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3020 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_configure)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3022 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 3023 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_compile)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 3024 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3025 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 3026 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3027 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3028 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 3029 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3030 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package)
NOTE: Running task 3031 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure_ptest_base)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3033 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile)
NOTE: recipe pango-1.46.2-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3034 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Succeeded
NOTE: Running task 3035 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_compile: Succeeded
NOTE: Running task 3037 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_install)
NOTE: recipe vala-0.48.9-r0: task do_install: Started
NOTE: recipe vala-0.48.9-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package)
NOTE: Running task 3039 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_package: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Started
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm)
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3043 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install)
NOTE: recipe pango-1.46.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3045 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot)
NOTE: Running task 3046 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package)
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3047 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3048 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_configure)
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Succeeded
NOTE: Running task 3049 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata)
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3050 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm)
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3051 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3052 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3053 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Succeeded
NOTE: Running task 3056 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_install)
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package)
NOTE: Running task 3059 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3060 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3065 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3066 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_compile)
NOTE: recipe gcr-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_install)
NOTE: recipe gcr-3.38.0-r0: task do_install: Started
NOTE: recipe gcr-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package)
NOTE: Running task 3074 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_package: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_packagedata)
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3077 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_qa)
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3078 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3078 tasks of which 2788 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1432 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (782 cached, 3 parsed). 1356 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f360cea56e9cf326f9f4792eec50bc6c3260b3a"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 154 Found 40 Missed 114 Current 805 (25% match, 88% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 849 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 959 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.00.1.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.00.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cantarell-fonts-0.0.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1213 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_fetch)
NOTE: Running task 1312 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_fetch)
NOTE: Running task 1378 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_fetch)
NOTE: Running task 1379 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_fetch)
NOTE: Running task 1380 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_fetch)
NOTE: Running task 1406 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Started
NOTE: Running task 1479 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_fetch)
NOTE: Running task 1537 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1551 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_unpack)
NOTE: Running task 1552 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Started
NOTE: Running task 1558 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Started
NOTE: Running task 1616 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_write_config)
NOTE: Running task 1617 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_write_config)
NOTE: Running task 1625 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_write_config)
NOTE: Running task 1633 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1642 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_unpack)
NOTE: Running task 1651 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_fetch)
NOTE: Running task 1674 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_fetch)
NOTE: Running task 1675 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_unpack)
NOTE: Running task 1715 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Started
NOTE: Running task 1716 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_unpack)
NOTE: Running task 1717 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_unpack)
NOTE: Running task 1718 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_unpack)
NOTE: Running task 1719 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_unpack)
NOTE: Running task 1720 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1721 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Started
NOTE: Running task 1722 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe pango-1.46.2-r0: task do_write_config: Started
NOTE: Running task 1754 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_fetch)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Started
NOTE: Running task 1755 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_fetch)
NOTE: Running task 1756 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_fetch)
NOTE: Running task 1757 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_fetch)
NOTE: Running task 1758 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Started
NOTE: Running task 1787 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_write_config: Succeeded
NOTE: Running task 1805 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_unpack)
NOTE: Running task 1806 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Started
NOTE: Running task 1807 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_unpack)
NOTE: Running task 1808 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_unpack)
NOTE: recipe pango-1.46.2-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Started
NOTE: Running task 1841 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_fetch)
NOTE: Running task 1842 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_patch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.10-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_fetch: Succeeded
NOTE: Running task 1892 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_unpack)
NOTE: Running task 1896 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_write_config)
NOTE: Running task 1897 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1913 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_fetch)
NOTE: Running task 1914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_fetch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Started
NOTE: Running task 1966 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_write_config)
NOTE: Running task 1967 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_write_config)
NOTE: Running task 1968 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_write_config)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1996 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_unpack)
NOTE: Running task 1997 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_unpack)
NOTE: Running task 1998 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_unpack)
NOTE: Running task 1999 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_unpack)
NOTE: Running task 2000 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2001 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 2002 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_unpack)
NOTE: Running task 2003 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_fetch: Started
NOTE: Running task 2037 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_patch)
NOTE: Running task 2038 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_unpack)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Started
NOTE: recipe vala-0.48.9-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Started
NOTE: Running task 2087 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_fetch)
NOTE: Running task 2088 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_unpack)
NOTE: Running task 2089 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Started
NOTE: Running task 2090 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe atk-2.36.0-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2091 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Started
NOTE: Running task 2100 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_patch)
NOTE: recipe p11-kit-0.23.21-r0: task do_fetch: Succeeded
NOTE: Running task 2101 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_patch)
NOTE: Running task 2111 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_unpack)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Started
NOTE: Running task 2207 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_write_config: Succeeded
NOTE: Running task 2208 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2209 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_write_config)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Started
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 2293 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_patch)
NOTE: Running task 2300 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_unpack)
NOTE: recipe atk-2.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2398 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_patch)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_unpack: Succeeded
NOTE: Running task 2447 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_patch)
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Started
NOTE: Running task 2485 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_patch)
NOTE: Running task 2490 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_unpack: Succeeded
NOTE: Running task 2540 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_patch)
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 2587 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_patch)
NOTE: recipe atk-2.36.0-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Started
NOTE: recipe pango-1.46.2-r0: task do_patch: Started
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Started
NOTE: Running task 2737 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_patch: Succeeded
NOTE: Running task 2760 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2816 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.46.2-r0: task do_patch: Succeeded
NOTE: Running task 2862 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_unpack: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_write_config: Succeeded
NOTE: Running task 2863 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_patch)
NOTE: Running task 2864 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2865 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2866 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_patch)
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2867 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_patch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 2868 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2869 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Started
NOTE: recipe vala-0.48.9-r0: task do_patch: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_patch: Succeeded
NOTE: Running task 2870 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.23.21-r0: task do_patch: Succeeded
NOTE: Running task 2871 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_deploy_source_date_epoch)
NOTE: recipe gcr-3.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 2872 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_patch)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2873 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_patch: Started
NOTE: recipe gcr-3.38.0-r0: task do_patch: Succeeded
NOTE: Running task 2874 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2875 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_patch: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2877 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_generate_toolchain_file)
NOTE: recipe harfbuzz-2.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2878 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2879 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_lic unihash changed to 90d18f0235e4670a3e7215ebeb8cf16c8cb74346eb86b1fbab06f3f8c62f5025
NOTE: recipe fribidi-1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 2880 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2881 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2882 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 2883 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2884 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_configure)
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2885 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2886 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.7.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2887 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2888 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2889 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2890 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2891 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2892 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_configure)
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Started
NOTE: Running task 2894 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_unpack: Succeeded
NOTE: Running task 2895 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2896 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_configure)
NOTE: recipe shared-mime-info-2.0-r0: task do_configure: Succeeded
NOTE: Running task 2897 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2898 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_patch: Succeeded
NOTE: Running task 2899 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.22-r0: task do_patch: Succeeded
NOTE: Running task 2900 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2901 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.10-r0: task do_configure: Succeeded
NOTE: Running task 2902 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_patch: Succeeded
NOTE: Running task 2903 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.48.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2904 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_configure)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe atk-2.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_patch: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_configure: Started
NOTE: Running task 2905 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libepoxy-1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2906 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_configure)
NOTE: recipe atk-2.36.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2907 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_configure: Succeeded
NOTE: Running task 2908 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_compile)
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2909 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_configure)
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 2910 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_compile)
NOTE: recipe atk-2.36.0-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_compile)
NOTE: recipe fribidi-1.0.10-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_compile: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_compile: Succeeded
NOTE: Running task 2913 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_install: Succeeded
NOTE: Running task 2914 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_populate_sysroot)
NOTE: Running task 2915 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Started
NOTE: recipe fribidi-1.0.10-r0: task do_install: Succeeded
NOTE: Running task 2916 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_populate_sysroot)
NOTE: Running task 2917 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package)
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_configure: Succeeded
NOTE: Running task 2918 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2919 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_configure: Succeeded
NOTE: Running task 2920 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_compile)
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_install)
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package: Succeeded
NOTE: Running task 2923 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_compile: Succeeded
NOTE: Running task 2924 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_install)
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Started
NOTE: Running task 2925 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2926 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2927 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.10.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package: Succeeded
NOTE: Running task 2928 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_packagedata)
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_install: Succeeded
NOTE: Running task 2929 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_populate_sysroot)
NOTE: Running task 2930 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2931 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.5.bb:do_package_write_rpm)
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Started
NOTE: recipe fribidi-1.0.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2932 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_install: Succeeded
NOTE: Running task 2933 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_populate_sysroot)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libjpeg-turbo-1_2.0.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2934 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_configure)
NOTE: Running task 2935 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package)
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_compile)
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_configure: Succeeded
NOTE: Running task 2937 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_configure: Succeeded
NOTE: Running task 2938 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Started
NOTE: recipe atk-2.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2939 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.30-r0: task do_package: Succeeded
NOTE: Running task 2940 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2942 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_compile: Succeeded
NOTE: Running task 2943 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_install)
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_compile: Succeeded
NOTE: Running task 2944 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_install)
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_install: Succeeded
NOTE: Running task 2945 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 2946 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2947 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_install: Succeeded
NOTE: Running task 2948 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2949 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package)
NOTE: Running task 2950 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Started
NOTE: Running task 2951 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_install: Succeeded
NOTE: Running task 2952 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_populate_sysroot)
NOTE: Running task 2953 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package)
NOTE: recipe xkeyboard-config-2.30-r0: task do_packagedata: Succeeded
NOTE: Running task 2954 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb:do_package_write_rpm)
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_install: Succeeded
NOTE: Running task 2955 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Started
NOTE: Running task 2956 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_compile: Succeeded
NOTE: Running task 2957 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2958 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcursor-1_1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2959 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_configure)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_install: Succeeded
NOTE: Running task 2961 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_populate_sysroot)
NOTE: Running task 2962 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Started
NOTE: recipe atk-2.36.0-r0: task do_package: Succeeded
NOTE: Running task 2963 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_packagedata)
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package: Succeeded
NOTE: Running task 2964 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_packagedata)
NOTE: Running task 2965 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2966 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.10-r0: task do_package: Succeeded
NOTE: Running task 2967 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_packagedata)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2968 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.3.bb:do_package_write_rpm)
NOTE: Running task 2969 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.5.bb:do_package_write_rpm)
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Started
NOTE: recipe libxcursor-1_1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2970 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.0.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.0-r0: task do_install: Succeeded
NOTE: Running task 2971 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2976 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb:do_package_write_rpm)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package: Succeeded
NOTE: Running task 2977 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxft-1_2.3.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2978 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/atk_2.36.0.bb:do_package_write_rpm)
NOTE: recipe libxkbcommon-0.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2979 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_0.10.0.bb:do_package_write_rpm)
NOTE: Running task 2980 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_configure: Succeeded
NOTE: Running task 2981 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_compile)
NOTE: recipe libxi-1_1.7.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vala-0.48.9-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 2982 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_install)
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Started
NOTE: recipe libxkbcommon-0.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_install: Succeeded
NOTE: Running task 2983 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 2984 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package)
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe atk-2.36.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.4-r0: task do_package: Succeeded
NOTE: Running task 2986 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2987 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure: Succeeded
NOTE: Running task 2988 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2989 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2990 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_compile)
NOTE: recipe libxtst-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2991 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_compile)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 2992 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_install)
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 2993 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 2994 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2995 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2996 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_install: Succeeded
NOTE: Running task 2997 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_populate_sysroot)
NOTE: Running task 2998 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile: Succeeded
NOTE: Running task 2999 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3000 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install)
NOTE: recipe libtasn1-4.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3001 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3002 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3003 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_configure)
NOTE: recipe libxtst-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3004 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3005 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_configure)
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libtasn1-4.16.0-r0: task do_package: Succeeded
NOTE: Running task 3006 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_packagedata)
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3007 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.16.0.bb:do_package_write_rpm)
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libtasn1-4.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_install_ptest_base)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_configure: Succeeded
NOTE: Running task 3009 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3010 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_populate_sysroot)
NOTE: Running task 3011 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_configure: Succeeded
NOTE: Running task 3012 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3013 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_install)
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_install: Succeeded
NOTE: Running task 3014 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_populate_sysroot)
NOTE: Running task 3015 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package)
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_compile: Succeeded
NOTE: Running task 3016 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_install)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3017 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3018 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure)
NOTE: recipe pango-1.46.2-r0: task do_configure: Started
NOTE: recipe vala-0.48.9-r0: task do_compile: Succeeded
NOTE: Running task 3019 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_install)
NOTE: recipe vala-0.48.9-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_install: Succeeded
NOTE: Running task 3020 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_populate_sysroot)
NOTE: Running task 3021 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package: Succeeded
NOTE: Running task 3022 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_package: Succeeded
NOTE: Running task 3023 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_install: Succeeded
NOTE: Running task 3024 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package)
NOTE: Running task 3025 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_populate_sysroot)
NOTE: recipe vala-0.48.9-r0: task do_package: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Started
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3026 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.2.bb:do_package_write_rpm)
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3027 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3028 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb:do_package_write_rpm)
NOTE: recipe pango-1.46.2-r0: task do_configure: Succeeded
NOTE: Running task 3029 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_configure_ptest_base)
NOTE: recipe vala-0.48.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3030 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile)
NOTE: recipe pango-1.46.2-r0: task do_compile: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3031 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_configure)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_configure: Succeeded
NOTE: Running task 3032 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package: Succeeded
NOTE: Running task 3033 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Started
NOTE: recipe vala-0.48.9-r0: task do_package: Succeeded
NOTE: Running task 3034 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_packagedata)
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_compile: Succeeded
NOTE: Running task 3035 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_install)
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Started
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
ERROR: vala-0.48.9-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.50.1-r0 to 0:0.48.9-r0) [version-going-backwards]
NOTE: recipe vala-0.48.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3036 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.48.9.bb:do_package_write_rpm)
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-core-2.36.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3037 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.36.1.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_install: Succeeded
NOTE: Running task 3038 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_populate_sysroot)
NOTE: Running task 3039 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package)
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.36.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdk-pixbuf-2.40.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package: Succeeded
NOTE: Running task 3040 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_packagedata)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3041 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb:do_package_write_rpm)
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Started
NOTE: recipe at-spi2-atk-2.34.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe harfbuzz-2.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_compile: Succeeded
NOTE: Running task 3042 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_compile_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3043 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install)
NOTE: recipe pango-1.46.2-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_install: Succeeded
NOTE: Running task 3044 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_install_ptest_base)
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.46.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3045 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot)
NOTE: Running task 3046 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package)
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.46.2-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_compile: Succeeded
NOTE: Running task 3047 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_install)
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Started
NOTE: recipe pango-1.46.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3048 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.48.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_install: Succeeded
NOTE: Running task 3049 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package)
NOTE: Running task 3050 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_populate_sysroot)
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.46.2-r0: task do_package: Succeeded
NOTE: Running task 3051 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3052 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_configure)
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Started
NOTE: recipe pango-1.46.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3053 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_package_write_rpm)
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package: Succeeded
NOTE: Running task 3054 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_packagedata)
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Started
NOTE: recipe pango-1.46.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe p11-kit-0.23.21-r0: task do_packagedata: Succeeded
NOTE: Running task 3055 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb:do_package_write_rpm)
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Started
NOTE: recipe p11-kit-0.23.21-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk+3-3.24.22-r0: task do_configure: Succeeded
NOTE: Running task 3056 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_compile)
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_install)
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_install: Succeeded
NOTE: Running task 3058 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package)
NOTE: Running task 3059 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3060 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3065 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_configure)
NOTE: recipe gcr-3.38.0-r0: task do_configure: Started
NOTE: recipe gcr-3.38.0-r0: task do_configure: Succeeded
NOTE: Running task 3066 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_compile)
NOTE: recipe gcr-3.38.0-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package: Succeeded
NOTE: Running task 3067 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_packagedata: Succeeded
NOTE: Running task 3071 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.22.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_compile: Succeeded
NOTE: Running task 3072 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_install)
NOTE: recipe gcr-3.38.0-r0: task do_install: Started
NOTE: recipe gcr-3.38.0-r0: task do_install: Succeeded
NOTE: Running task 3073 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package)
NOTE: Running task 3074 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_populate_sysroot)
NOTE: recipe gcr-3.38.0-r0: task do_package: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-3.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package: Succeeded
NOTE: Running task 3075 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_packagedata)
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Started
NOTE: recipe gcr-3.38.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3076 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_write_rpm)
NOTE: Running task 3077 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_package_qa)
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.22-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe gcr-3.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3078 of 3078 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_3.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 3078 tasks of which 2788 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============1323058073621252207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gcr-upgrade-3.36.0-3.38.0.patch"

From 2616bbcff30cc2a64fec7f984eaf6284888dc01f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 07:00:34 +0000
Subject: [PATCH] gcr: upgrade 3.36.0 -> 3.38.0

---
 ...-meson-Make-sure-gcr-oids.h-is-built.patch | 36 ---------------
 ...ectly-set-internal-vapi-dependencies.patch | 45 -------------------
 .../gcr/{gcr_3.36.0.bb => gcr_3.38.0.bb}      |  6 +--
 3 files changed, 1 insertion(+), 86 deletions(-)
 delete mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
 delete mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
 rename meta/recipes-gnome/gcr/{gcr_3.36.0.bb => gcr_3.38.0.bb} (77%)

diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
deleted file mode 100644
index 4bf5bfba94..0000000000
--- a/meta/recipes-gnome/gcr/gcr/0001-meson-Make-sure-gcr-oids.h-is-built.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9fca6ae0aa7355c27d0922c561b9fbe18dde5b3d Mon Sep 17 00:00:00 2001
-From: Niels De Graef <nielsdegraef@gmail.com>
-Date: Fri, 19 Jun 2020 22:37:31 +0200
-Subject: [PATCH 1/1] meson: Make sure gcr-oids.h is built
-
-Fixes https://gitlab.gnome.org/GNOME/gcr/-/issues/48
----
- gcr/meson.build | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
---- end of original header ---
-
-Upstream-Status: Backport  [https://github.com/GNOME/gcr.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 199452f..06c3a63 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -178,7 +178,10 @@ endif
- gcr_base_dep = declare_dependency(
-   link_with: gcr_base_lib,
-   include_directories: include_directories('..'),
--  sources: gcr_enums_gen[1], # Make sure gcr-enum-types-base.h can be included
-+  sources: [
-+    gcr_enums_gen[1],
-+    gcr_oids[1],
-+  ],
- )
- 
- if get_option('introspection')
--- 
-2.7.4
-
diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
deleted file mode 100644
index b484a1b222..0000000000
--- a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-set-internal-vapi-dependencies.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ebb77dad4563b882b449cbc5e882f36ac8c2de71 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 11 May 2020 22:19:16 +0000
-Subject: [PATCH] meson.build: correctly set internal vapi dependencies
-
-If they are set as strings, meson will supply the right
-arguments to vapigen, but will not set the ninja dependencies
-to ensure they get built first, and so races will occur:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1881/steps/8/logs/step1b
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/55]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gcr/meson.build | 2 +-
- ui/meson.build  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gcr/meson.build b/gcr/meson.build
-index 254a933..199452f 100644
---- a/gcr/meson.build
-+++ b/gcr/meson.build
-@@ -203,7 +203,7 @@ if get_option('introspection')
- 
-   gcr_vapi = gnome.generate_vapi('gcr-@0@'.format(gcr_major_version),
-     sources: gcr_gir[0],
--    packages: [ 'glib-2.0', 'gio-2.0', 'gck-@0@'.format(gck_major_version) ],
-+    packages: [ 'glib-2.0', 'gio-2.0', gck_vapi ],
-     metadata_dirs: meson.current_source_dir(),
-     vapi_dirs: [
-       build_root / 'gck',
-diff --git a/ui/meson.build b/ui/meson.build
-index 5ca3753..477412d 100644
---- a/ui/meson.build
-+++ b/ui/meson.build
-@@ -174,8 +174,8 @@ if get_option('introspection')
-     packages: [
-       'glib-2.0',
-       'gio-2.0',
--      'gck-@0@'.format(gck_major_version),
--      'gcr-@0@'.format(gcr_major_version),
-+      gck_vapi,
-+      gcr_vapi,
-       'gtk+-3.0'
-     ],
-     metadata_dirs: meson.current_source_dir(),
diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.38.0.bb
similarity index 77%
rename from meta/recipes-gnome/gcr/gcr_3.36.0.bb
rename to meta/recipes-gnome/gcr/gcr_3.38.0.bb
index ff455a68ec..49e8f1848b 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.38.0.bb
@@ -17,11 +17,7 @@ inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even
 # depends on gtk+3, but also x11 through gtk+-x11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://0001-meson.build-correctly-set-internal-vapi-dependencies.patch"
-SRC_URI += " file://0001-meson-Make-sure-gcr-oids.h-is-built.patch"
-
-SRC_URI[archive.md5sum] = "adc65563b6b458507b9a578a8b68fb61"
-SRC_URI[archive.sha256sum] = "aaf9bed017a2263c6145c89a1a84178f9f40f238426463e4ae486694ef5f6601"
+SRC_URI[archive.sha256sum] = "a64cc7b65757fc2cd16de1708d132a16d05cd1f62c6eba436d56fe45d4ba27e1"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.18.4


--===============1323058073621252207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gcr/gcr-dbg: PKGSIZE changed from 3109928 to 3114952 (+0%)
packages/core2-32-poky-linux/gcr/gcr-dbg: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-dbg: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-dev: PKGSIZE changed from 1495833 to 1495824 (-0%)
packages/core2-32-poky-linux/gcr/gcr-dev: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-dev: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-doc: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-doc: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-af: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-af: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ar: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-as: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-as: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ast: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-az: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-az: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be+latin: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-be: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-be: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bg: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn-in: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bn: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-bs: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca+valencia: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PKGSIZE changed from 17224 to 17389 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ca: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ckb: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PKGSIZE changed from 16960 to 17141 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cs: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-cy: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-da: PKGSIZE changed from 16653 to 16839 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-da: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-da: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-de: PKGSIZE changed from 16880 to 17794 (+5%)
packages/core2-32-poky-linux/gcr/gcr-locale-de: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-de: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-dz: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-el: PKGSIZE changed from 20959 to 21945 (+5%)
packages/core2-32-poky-linux/gcr/gcr-locale-el: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-el: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en+shaw: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-ca: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-en-gb: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eo: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-es: PKGSIZE changed from 17267 to 17433 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-es: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-es: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-et: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-et: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PKGSIZE changed from 16954 to 17123 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-eu: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fa: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fi: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PKGSIZE changed from 17313 to 17535 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PKGSIZE changed from 16006 to 16893 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-fur: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ga: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PKGSIZE changed from 17155 to 17319 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gl: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-gu: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-he: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-he: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hi: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PKGSIZE changed from 16666 to 16839 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PKGSIZE changed from 17155 to 17331 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-hu: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-id: PKGSIZE changed from 16466 to 16631 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-id: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-id: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-is: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-is: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-it: PKGSIZE changed from 16964 to 17134 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-it: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-it: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PKGSIZE changed from 17048 to 17264 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ja: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ka: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kk: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-kn: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PKGSIZE changed from 16973 to 17141 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ko: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PKGSIZE changed from 16800 to 16972 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lt: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PKGSIZE changed from 16316 to 17238 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-lv: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mai: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mg: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mk: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ml: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mn: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-mr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ms: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nb: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ne: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PKGSIZE changed from 17082 to 17254 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nl: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-nn: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-oc: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-or: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-or: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pa: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PKGSIZE changed from 16896 to 17080 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pl: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PKGSIZE changed from 17203 to 17375 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt-br: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PKGSIZE changed from 16244 to 17281 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-pt: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PKGSIZE changed from 16366 to 17272 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ro: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ru: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-rw: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-si: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-si: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PKGSIZE changed from 16447 to 17352 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sk: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PKGSIZE changed from 15935 to 16769 (+5%)
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sl: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sq: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr+latin: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PKGSIZE changed from 19364 to 20428 (+5%)
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PKGSIZE changed from 16492 to 16669 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-sv: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ta: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-te: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-te: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tg: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-th: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-th: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PKGSIZE changed from 16814 to 16967 (+1%)
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-tr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-ug: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PKGSIZE changed from 18800 to 20816 (+11%)
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-uk: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-vi: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-xh: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PKGSIZE changed from 15040 to 15873 (+6%)
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-cn: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-hk: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-locale-zh-tw: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-src: PKGSIZE changed from 2461224 to 2458881 (-0%)
packages/core2-32-poky-linux/gcr/gcr-src: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-src: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr-staticdev: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr-staticdev: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr/gcr: PKGSIZE changed from 1570910 to 1571011 (+0%)
packages/core2-32-poky-linux/gcr/gcr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr/gcr: PV changed from "3.36.0" to "3.38.0"
packages/core2-32-poky-linux/gcr: PKGV changed from 3.36.0 [default] to 3.38.0 [default]
packages/core2-32-poky-linux/gcr: PV changed from "3.36.0" to "3.38.0"

--===============1323058073621252207==--
